void main(){
  Map<String, Object> mapa = {
    "page": 1,
    "perPage": 30,
    "totalItems": 1,
    "totalPages": 1,
    "items": [
      {
        "id": "",
        "created": "",
        "updated": "",
        "collectionId": "",
        "collectionName": "",
        "expand": {},
        "codauxiliar": 155500,
        "descricao": "maizena",
        "embalagem": "(1x1un)"
      }
    ]
  };

// Acessando a lista "items"
  var items = mapa['items'] as List;

// Pegando o valor de codauxiliar do primeiro item
  var codAuxiliar = items[0]['codauxiliar'];

// Imprimindo o valor
  print(codAuxiliar); // Saída: 155500
}