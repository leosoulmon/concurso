angular.module("concurso", ['ngAnimate', 'ngRoute'])
.config(function($routeProvider){
	
	$routeProvider.when("/home", {
		templateUrl: "partials/home.asp"
		//controller:
	});

	$routeProvider.when("/sobre", {
		templateUrl: "partials/sobre.asp"
		//controller:
	});

	$routeProvider.when("/inscricoes", {
		templateUrl: "partials/encerradas.asp"
	 	//controller:
	});

	// $routeProvider.when("/prova", {
	// 	templateUrl: "partials/prova.asp"
	// 	//controller:
	// });

	$routeProvider.when("/ensinomedio", {
		templateUrl: "partials/ensino_medio.asp"
		//controller:
	});

	$routeProvider.when("/regulamento", {
		templateUrl: "partials/regulamento.asp"
		//controller:
	});

	$routeProvider.when("/contato", {
		templateUrl: "partials/contato.asp"
		//controller:
	});

	$routeProvider.otherwise({ redirectTo: "/home"});
});