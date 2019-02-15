module Api
	module V1
		class BatchesController < ApplicationController

			def create
				begin
					batch = Batch.new(batch_params)
					batch[:reference] = (rand(0...1000)).to_s + (DateTime.now).to_s

					if (batch.save)
						orders = Order.where(purchaseChannel: batch_params[:purchaseChannel]).update_all(batch_id: batch[:id], status: 'production')
						
						result = Batch.joins(:orders).where('orders.batch_id =?', batch[:id]).select('batches.reference, count(*) as total_orders').as_json(:except => :id)
						
						render json: {status: 'SUCCESS', message: 'Batch saved', data: result}, status: :ok
					else
						render json: {status: 'ERROR', message: 'Batch not saved', data: batch.errors}, status: :unprocessable_entity
					end
				rescue StandardError => e
					print e
				end
			end

			def produceBatch
				begin
					batch = Batch.find(params[:batch_id])

					orders = Order.where(batch_id: params[:id]).update_all(status: 'closing')

					render json: {status: 'SUCCESS', message: 'Orders associated white this batch have been changed!', data: orders}, status: :ok
				rescue StandardError => e
					print e
				end
			end

			def markOrderAsSent
				begin
					batch = Batch.find(params[:batch_id])
					orders = Order.where(batch_id: params[:batch_id]).update_all(status: 'sent', deliveryService: params[:delivery_service])
					render json: {status: 'SUCCESS', message: 'Orders associated white this batch have been changed!', data: orders}, status: :ok
				rescue StandardError => e
					print e
				end
			end

			private
			def batch_params
				params.permit(:purchaseChannel)
			end

		end
	end
end
