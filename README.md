# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
	-2.5.3
* Rails version
	-5.2.2
* System dependencies
	-gem mysql2
* Configuration
	-Utilização em conjunto com wamppserver 64 bits
	-PHPMydmin para gerenciamento dos dados
	-Postman para teste das URLs
* Database creation
	-somente executar o comando rails db:migrate na pasta
* Database initialization
	-none
* How to run the test suite
	-none, apenas tratamento básico para erros (begin/rescue)
* Services (job queues, cache servers, search engines, etc.)
	-none
* Deployment instructions<br/>
	-none
* Utilização
	-as urls foram utilizadas no postman setando-se o método HTTP em destaque
	Seguir o padrão de URI para acessar o determinado recurso:
	 -POST api/v1/orders(cria uma order)
	 -GET api/v1/orders/getStatus/:id(recupera o status de uma order pelo id)
	 -GET api/v1/orders/getOrdersByPChannel/:pchannel(busca as orders pelo PurchaseChannel passado)
	 -POST api/v1/batches/produceBatch/:batch_id(altera as orders associadas com o batch que estavam como 'production' para status 'closing')
	 -POST api/v1/batches/markOrderAsSent/:batch_id/:delivery_service(ajusta o status das orders para 'sent' de acordo com o delivery_Service)
	 -GET api/v1/reports/getSimpleReport(recupera dados em formato relatório explicitando os purchase channel e suas orders e totais)