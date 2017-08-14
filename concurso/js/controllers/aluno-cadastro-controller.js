// angular.module('alurapic').controller('AlunoCadastroController', function($scope, $http){
    
//     $scope.alunocadastro = {};
//     $scope.mensagem = '';

//     $scope.cadastraraluno = function() {

//         if ($scope.formulario.$valid) {

//             $http.post('/scripts/', $scope.alunocadastro)
//             .success(function() {
//                 $scope.alunocadastro = {};
//                 $scope.mensagem = 'Aluno cadastrado com sucesso';
//             })
//             .error(function(erro) {
//                 console.log(erro);
//                 $scope.mensagem = 'Não foi possível cadastrar o aluno';
//             })
//         }
//     };
// });