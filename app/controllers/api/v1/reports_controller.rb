module Api
	module V1
		class ReportsController < ApplicationController


			def getSimpleReport
				begin
					orders = Order.select('purchaseChannel, count(*) as total_orders', 'sum(totalValue) as total_value').group('purchaseChannel').as_json(:except => :id)
					render json: {status: 'SUCCESS', message: 'Report generated with success', data: orders}, status: :ok
				rescue StandardError => e
					print e
				end
			end

		end
	end
end
