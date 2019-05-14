
<!--/////Funcion para insertar mediante DOM opiniones en una lista /////-->
function opiniones()
{
  var nombreusuario = prompt("¿Como te llamas?");
  var titulo = prompt("Escribe el titulo de tu opinión");
  var cuerpo = prompt("Escribe el contenido de tu opinión");

  var div1 = document.createElement("div");
  div1.setAttribute("class","list-group-item list-group-item-action flex-column align-items-start active");

  var div2 = document.createElement("div");
  div2.setAttribute("class","d-flex w-100 justify-content-between");
  div1.appendChild(div2);

  var h5 = document.createElement("h5");
  h5.setAttribute("class","mb-1");
  var textoh5 = document.createTextNode(titulo);
  h5.appendChild(textoh5);
  div2.appendChild(h5);

  var small = document.createElement("small");
  var textosmall = document.createTextNode("Hace menos de un minuto");
  small.appendChild(textosmall);
  div2.appendChild(small);

  var p = document.createElement("p");
  p.setAttribute("class","mb-1");
  var textop = document.createTextNode(cuerpo);
  p.appendChild(textop);
  div1.appendChild(p);

  var small1 = document.createElement("small");
  var textosmall1 = document.createTextNode(nombreusuario);
  small1.appendChild(textosmall1);
  div1.appendChild(small1);

  var br = document.createElement("br");
  div1.appendChild(br);

  var span = document.createElement("span");
  span.setAttribute("class","xt-warning");
  var textospan = document.createTextNode("\u2605 \u2605 \u2605 \u2605 \u2605");
  span.appendChild(textospan);
  div1.appendChild(span);

  var lista = document.getElementById("listaopiniones")
  lista.appendChild(div1);
}


<!--/////Con esta funcion valido los campos de formulario de registro/////-->
function validar()
{
  if (validarcontraseña() == true && validarnombre() == true && validaremail() == true)
  {
      return true;
  }
  else {
    return false;
  }
}

<!--/////En esta funcion valido la contraseña mediante expresiones regulares/////-->
function validarcontraseña()
{
  var valor = document.getElementById("idcontraseña").value;
  var valor2 = document.getElementById("idconfirmarcontraseña").value;
  var reg = /^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{3,}$/;

  if (!(reg.test(valor)))
  {
      alert("¡La contraseña tiene que tener letras mayúsculas,minúsculas y números!");
      return false;
  }
  else if (valor != valor2)
  {
    alert("La contraseñas deben coincidir!");
    return false;
  }
  else
  {
      return true;
  }
}

<!--/////En esta funcion valido el nombre mediante expresiones regulares/////-->
function validarnombre()
{
  var valor = document.getElementById("idnombre").value;
  var reg = /^[a-z A-Z]{4,}$/;

  if (!(reg.test(valor)))
  {
      alert("¡El nombre tiene que tener 4 letras minimo!");
      return false;
  }
  else
  {
      return true;
  }
}

<!--/////En esta funcion valido el email mediante expresiones regulares/////-->
function validaremail()
{
  var valor = document.getElementById("idemail").value;
  var reg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

  if (!(reg.test(valor)))
  {
      alert("¡El formato del email no es correcto!");
      return false;
  }
  else
  {
      return true;
  }
}

<!--/////En esta funcion valido que no se introduzca caracteres numericos/////-->
function TeclasPermitidas(miEvento)
{
  var evento = miEvento || window.event;

  if ((evento.charCode >= 65 && evento.charCode <= 90) || (evento.charCode >= 97 && evento.charCode <= 122 ) || evento.charCode == 32)
  {
    return true;
  }
  else
  {
    return false;
  }
}

<!--/////En esta funcion valido que no se introduzca caracteres alfabeticos/////-->
function TeclasPermitidas2(miEvento)
{
  var evento = miEvento || window.event;

  if ((evento.charCode >= 48 && evento.charCode <= 57) || evento.charCode == 45)
  {
    return true;
  }
  else
  {
    return false;
  }
}

<!--/////En esta funcion se crea las cookies/////-->
function crear()
  {
    setcookie(document.getElementById("idlogin").id,document.getElementById("idlogin").value,);
    setcookie(document.getElementById("idlogincontraseña").id,document.getElementById("idlogincontraseña").value,);
    mostrar();
    location.href = "./index.html";
  }

<!--/////En esta funcion se muestra las cookies/////-->
function mostrar()
  {
    alert("Bienvenido de nuevo " + getcookie(document.getElementById("idlogin").id) + "!!");
    alert("Recuerda que tu contraseña es: " + getcookie(document.getElementById("idlogincontraseña").id) + "!!");
  }

<!--/////En esta funcion se obtiene las cookies/////-->
function getcookie(cname)
  {
    var i,x,y,ARRcookies=document.cookie.split(";");
    for (i = 0; i < ARRcookies.length; i++)
    {
      x = ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
      y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
      x = x.replace(/^\s+|\s+$/g,"");

      if (x == cname)
        {
          return unescape(y);
        }
      }
  }

<!--/////En esta funcion se le asigna los valores correspondientes a la cookie y se crea/////-->
      function setcookie(cname,value,exdays)
      {
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cvalue = escape(value) + ((exdays == null) ? "" : "expires = "+ exdate.toUTCString());
        document.cookie = cname + "=" + value;
      }

<!--/////Esta funcion te redirecciona a la pargina de carga/////-->
function redireccionar() {
      location.href = "./carga.html";
    }

<!--/////Esta funcion te redirecciona a la pargina de exito/////-->
function redireccionarexito() {
      location.href = "./exito.html";
    }
