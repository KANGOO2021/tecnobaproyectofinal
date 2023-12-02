//variables
let allContainerCart = document.querySelector('#products');
let allContainerCartCel = document.querySelector('#products_cel');


//functions
loadEventListenrs();
function loadEventListenrs(){
    allContainerCart.addEventListener('click', addProduct);
    allContainerCartCel.addEventListener('click', addProduct);
     
}

function addProduct(e){
 
    if (e.target.classList.contains('btn-add-cart')) {
       
      
     	Swal.fire("Por favor debe ingresar al Login!");
    }
    
}

//agregar clase active al carrousel de productos modo celular

let active =document.getElementById("carrousel-cel");

active.classList.add("active");


























	


