// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"



Rails.start()
Turbolinks.start()
ActiveStorage.start()

  $("#buscador_clientes").keyup(function(event){
    let termino = $(this).val();
    
    if(termino.length == 0) {
      $("#tabla_buscador_clientes tbody").empty();
    }
    else {
      let request_url = getRootUrl() + "/buscador_clientes/" + termino;
      $.get(request_url, function(data, status){
        if(data.length > 0){
          $("#tabla_buscador_clientes tbody").empty();
          for(x in data){
            let apellido = data[x].apellido_cliente;
            let id_cliente = data[x].id;
            console.log(apellido);
            let rowContent = `
               <tr>
                 <td>${apellido}</td>
                 <td>
                     <button 
                       class = "btn btn-primary"
                       onclick="seleccionarCliente(${id_cliente})"
                       >
                         Agregar
                     </button>
                 </td>
               </tr>
            `;
            $("#tabla_buscador_clientes tbody").append(rowContent);
          }
        }
      });
    }
  });


function getRootUrl() {
    return window.location.origin;
}