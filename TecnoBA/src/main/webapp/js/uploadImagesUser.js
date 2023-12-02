// Import the functions you need from the SDKs you need
import { initializeApp } from "https://www.gstatic.com/firebasejs/10.6.0/firebase-app.js";
import { getStorage, ref, getDownloadURL, uploadBytes } from "https://www.gstatic.com/firebasejs/10.6.0/firebase-storage.js";;
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
    apiKey: "AIzaSyDkDZxTrQal9iH_6cuM1nv9mwq98Lm-MrU",
    authDomain: "tecnoba-eb442.firebaseapp.com",
    projectId: "tecnoba-eb442",
    storageBucket: "tecnoba-eb442.appspot.com",
    messagingSenderId: "1040639465203",
    appId: "1:1040639465203:web:b4911d7271a4dca6f84986",
    measurementId: "G-04WM90D2HE"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const storage = getStorage(app);



//subir imagenes de productos a Firebase y obtener URL
const name = document.getElementById('imagen');

document.getElementById("boton").addEventListener("click", function () {


    alert('Selected file: ' + name.files.item(0).name);
    const storageRef = ref(storage, 'usuarios/' + name.files.item(0).name);



    // 'file' comes from the Blob or File API
    uploadBytes(storageRef, name.files[0]).then((snapshot) => {
        console.log('Uploaded a blob or file!');

        getDownloadURL(ref(storage, 'usuarios/' + name.files.item(0).name))
            .then((url) => {
                // `url` is the download URL for 'images/stars.jpg'

                //console.log(url)


                // Or inserted into an <img> element
                const img = document.getElementById('up-img');
                img.value=url;
                //const img1 = document.getElementById('image');
                //img1.setAttribute('src', url);
            })
            .catch((error) => {
                console.log(errorMessage);
            });
    });
})
 
 

  
 
 











 