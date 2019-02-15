# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version<br/>
	-2.5.3
* Rails version<br/>
	-5.2.2
* System dependencies<br/>
	-gem mysql2
* Configuration<br/>
	-Utilização em conjunto com wamppserver 64 bits<br/>
	-PHPMydmin para gerenciamento dos dados<br/>
	-Postman para teste das URLs<br/>
* Database creation<br/>
	-somente executar o comando rails db:migrate na pasta
* Database initialization<br/>
	-none
* How to run the test suite<br/>
	-none, apenas tratamento básico para erros (begin/rescue)
* Services (job queues, cache servers, search engines, etc.)<br/>
	-none
* Deployment instructions<br/>
	-none
* Utilização<br/>
	-as urls foram utilizadas no postman setando-se o método HTTP em destaque<br/>
	Seguir o padrão de URI para acessar o determinado recurso:<br/>
	 -POST api/v1/orders(cria uma order)<br/>
	 -GET api/v1/orders/getStatus/:id(recupera o status de uma order pelo id)<br/>
	 -GET api/v1/orders/getOrdersByPChannel/:pchannel(busca as orders pelo PurchaseChannel passado)<br/>
	 -POST api/v1/batches/produceBatch/:batch_id(altera as orders associadas com o batch que estavam como 'production' para status 'closing')<br/>
	 -POST api/v1/batches/markOrderAsSent/:batch_id/:delivery_service(ajusta o status das orders para 'sent' de acordo com o delivery_Service)<br/>
	 -GET api/v1/reports/getSimpleReport(recupera dados em formato relatório explicitando os purchase channel e suas orders e totais)<br/>

	-Todos os resultados exibidos estão em formato json. Algumas das entradas devem ser feitas também em json como a criação da order.