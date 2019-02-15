module Api
	module V1
		class OrdersController < ApplicationController


			#create order
			def create
				begin
					order = Order.new(order_params)

					if order.save
						render json: {status: 'SUCCESS', message: 'Order saved', data: order}, status: :ok
					else
						render json: {status: 'ERROR', message: 'Order not saved', data: order.errors}, status: :unprocessable_entity
					end
				rescue StandardError => e
					print e
				end
			end

			#get the status
			def getStatus
				begin
					order = Order.find(params[:id])
					render json: {status: 'SUCCESS', message: 'Order details found!', data: order.status}, status: :ok
				rescue StandardError => e
					print e
				end
			end

			def getOrdersByPChannel
				begin
					orders = Order.select(:reference, :purchaseChannel, :clientName, :status).where('purchaseChannel=?', params[:pchannel])
					render json: {status: 'SUCCESS', message: 'Orders found', data: orders}, status: :ok
				rescue StandardError => e
					print e
				end
			end


			private
			def order_params
				params.permit(:reference, :purchaseChannel, :clientName, :address, :deliveryService, :totalValue, :lineItems, :status)
			end

		end
	end
end
