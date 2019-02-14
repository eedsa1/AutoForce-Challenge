module Api
	module V1
		class OrdersController < ApplicationController


			def print
				orders = Order.order('created_at DESC');
				render json: {status: 'SUCCESS', message: 'sadasd', data: orders}, status: :ok
			end

			#create order
			def create
				order = Order.new(order_params)

				if order.save
					render json: {status: 'SUCCESS', message: 'Order saved', data: order}, status: :ok
				else
					render json: {status: 'ERROR', message: 'Order not saved', data: order.errors}, status: :unprocessable_entity
				end
			end

			#get the status
			def getStatus
				order = Order.find(params[:id])
				render json: {status: 'SUCCESS', message: 'Order details found!', data: order.status}, status: :ok
			end

			def getOrdersByPChannel
				orders = Order.select(:reference, :purchaseChannel, :clientName, :status).where('purchaseChannel=?', params[:id])
				render json: {status: 'SUCCESS', message: 'Orders found', data: orders}, status: :ok
			end


			private
			def order_params
				params.permit(:reference, :purchaseChannel, :clientName, :address, :deliveryService, :totalValue, :lineItems, :status)
			end

		end
	end
end
