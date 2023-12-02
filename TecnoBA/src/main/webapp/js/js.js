//variables
let allContainerCart = document.querySelector('#products');
let allContainerCartCel = document.querySelector('#products_cel');
let containerBuyCart = document.querySelector('.card-items');
let priceTotal = document.querySelector('.price-total');
let priceSubTotal = document.querySelector('#price-descuentos')
let priceFinal = document.querySelector('#price-final')
let amountProduct = document.querySelector('.count-product');



let buyThings = [];
let totalCard = 0;
let countProduct = 0;

//functions
loadEventListenrs();
function loadEventListenrs(){
    allContainerCart.addEventListener('click', addProduct);
    allContainerCartCel.addEventListener('click', addProduct);
    containerBuyCart.addEventListener('click', deleteProduct); 

}

function addProduct(e){
    e.preventDefault();
    if (e.target.classList.contains('btn-add-cart')) {
        const selectProduct = e.target.parentElement; 
        readTheContent(selectProduct);
       window.scroll(0, 400);
 
    }
  
    disabled()  
   
}

function deleteProduct(e) {
    if (e.target.classList.contains('delete-product')) {
        const deleteId = e.target.getAttribute('data-id');
        

        buyThings.forEach(value => {
            if (value.id == deleteId) {
                let priceReduce = parseInt(value.price) * parseInt(value.amount);
                totalCard =  totalCard - priceReduce;
               
            }
        });
        buyThings = buyThings.filter(product => product.id !== deleteId);
        
        countProduct--;
    }
   
    if (buyThings.length === 0) {
        priceTotal.innerHTML = 0;
        amountProduct.innerHTML = 0;
        totalCard = 0;
        
    }
    disabled()
    loadHtml();
}

function readTheContent(product){
         
    const infoProduct = {
       
        id: product.querySelector('a').getAttribute('data-id'),
        image: product.querySelector(".card-body img").src,
        title: product.querySelector('.title').textContent,
        price: product.querySelector('.valor').textContent,
        stock: product.querySelector('.stockActual').value,
        amount: 1
        
    }


    totalCard = parseInt(totalCard) + parseInt(infoProduct.price);
    
    

    const exist = buyThings.some(product => product.id === infoProduct.id);
    if (exist) {
        const pro = buyThings.map(product => {
            if (product.id === infoProduct.id) {
                product.amount++;
                
          
                return product;
            } else {
                return product
            }
        });
        buyThings = [...pro];
    } else {
        buyThings = [...buyThings, infoProduct]
        countProduct++;
    }
    loadHtml();
   
}


function loadHtml() {
	
    clearHtml();
    buyThings.forEach(product => {
        const { image, title, price, amount, stock, id } = product;
      
        const row = document.createElement('div');
        row.classList.add('cart','col-2');
        row.innerHTML = `
          <img class="cart-img" src="${image}" alt="">
            <div class="card-body">
                <h5 class="cart-title">${title}</h5>
                <h5 class="cart-text">$ ${ price }</h5>
                <div class="delete">
                    <span class="cart-cantidad">Cantidad: ${amount}</span>
               		<input id="producto_id" type="hidden" name="" value="${stock}">
                    <i class="fa-solid fa-delete-left fa-lg delete-product" style="color: #000000; cursor:pointer;" data-id="${id}"></i>
                </div>
                
                  <input type="hidden" name="cod" value="${id}">
		          <input type="hidden" name="txtStock" value="${stock-amount}">
	  	
            </div>
            
        `;

        containerBuyCart.appendChild(row);
        
        priceSubTotal.innerHTML = formatearNumero(totalCard);

        priceTotal.innerHTML = formatearNumero(totalCard);
        
        amountProduct.innerHTML = countProduct;
        
        let stock0= product.stock
        let stock00=stock-amount
        if(stock0 == 0 || stock00 == -1){
  		//console.log(stock0)
  			buyThings = [];
  		
        countProduct = 0;
      	amountProduct.innerHTML = 0;
        totalCard = 0;
        total = 0;
        priceFinal.innerHTML = 0;
        //alert('No hay stock')
        Swal.fire({
		  icon: "error",
		  title: "Sin stock",
		  text: "Intente la compra nuevamente!",
		  
		});
  		}

    });
}


function clearHtml() {
    containerBuyCart.innerHTML = '';
}

function disabled() { 
    if (buyThings.length > 0) {
        document.getElementById('disabled').classList.add('disabled');
        document.getElementById('container-products').classList.remove('container-products');
    } else if (buyThings.length === 0){
        document.getElementById('disabled').classList.remove('disabled');
        document.getElementById('container-products').classList.add('container-products');
        
    }
}

function enviarDatos(){
        	
        	 //document.forms[0].accion.value='editar'
        	 //document.forms[0].submit();
		document.getElementById('form').submit();
		   //document.forms[0].submit();
		    //document.forms.form.submit();
			
	
  }


function comprar() {

    if (priceFinal.innerHTML == 0 || priceFinal.innerHTML == priceSubTotal.innerHTML) {
        //alert('Selecciona tu banco')
        
        Swal.fire({
			  icon: "error",
			  title: "Error...",
			  text: "Selecciona tu banco!",
			 
			});

    }else{
        buyThings = [];
        //comprado= countProduct;
        countProduct = 0;
        amountProduct.innerHTML = 0;
        totalCard = 0;
        total = 0;
        priceFinal.innerHTML = 0;
        document.getElementById("seleccion").value = "";
        disabled()
        
        
        
        Swal.fire({
			position: "center",
			icon: "success",
			title: "Gracias por su compra",
			showConfirmButton: false,
			timer: 0
	});
		
		
	
       setTimeout(function () {
			
		
			enviarDatos()
			
			 
			 
			 }, 2000)
			

    }
    
}


function formatearNumero(number) {
    return new Intl.NumberFormat("es-CL").format(number);
}


function precioFinal(){

    let opcion = document.getElementById("seleccion").value
    //console.log(opcion)
   
    let total = totalCard - totalCard * opcion
    //console.log(total)
  
    priceFinal.innerHTML = formatearNumero(total.toFixed(0));

}

function descuentos(valor) { 

    document.getElementById("seleccion").value = valor;
    precioFinal() 
}

function volver(){
    document.getElementById("seleccion").value = "";
    priceFinal.innerHTML = 0;
}

//agregar clase active al carrousel de productos modo celular

let active =document.getElementById("carrousel-cel");

active.classList.add("active");



//para saber si es Admin o Usuario
	
let admin = document.getElementById("stock").value
//console.log(admin)
	if(admin !="admin"){
		//console.log("Soy usuario")
		let usuario = document.getElementById("usuario")
		usuario.className = "usuario";
}



  




	


