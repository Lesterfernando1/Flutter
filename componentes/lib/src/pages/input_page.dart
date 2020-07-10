import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre= '';
  String _email ='';
  String _fecha='';

  String _opcionesSeleccionada ='volar';

  List<String> _poderes =['volar','rayos x', 'super fuerza'];

  TextEditingController _inputFieldDateControll = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),//padding
        children: <Widget>[
          _crearInput(),//se usa la funcion
          Divider(),// se da un espacio
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha( context),
          Divider(),
          _crearDropdown( ),
          Divider(),
          _crearPersona(),
        ],

      ),

    );
  }

  Widget _crearInput() {

    return TextField(

      textCapitalization: TextCapitalization.words,//mayusculas
      decoration: InputDecoration(//decoracion en el input

        border: OutlineInputBorder( //borde
          borderRadius: BorderRadius.circular(20.0),
        ),

        counter: Text('Letras ${_nombre.length}'),//cuantas letras hay
        hintText: 'Nombre de la persona', //ejemplo de que escribir
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.accessibility),//icono al final
        icon: Icon(Icons.account_circle)//icono al principio
      ),

  onChanged: (valor){// funcion que cambie.
    
    setState(() { // para que se actualice siempre
      _nombre=valor; //se iguala el nombre al valor creado
    });

  },

    ); 
  }

 Widget _crearPersona(){ 
    return ListTile( 
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionesSeleccionada),
    );

  }


  Widget _crearEmail(){
    return TextField(
      keyboardType: TextInputType.emailAddress,

      decoration: InputDecoration(//decoracion en el input

        border: OutlineInputBorder( //borde
          borderRadius: BorderRadius.circular(20.0),
        ),

        hintText: 'Email', //ejemplo de que escribir
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),//icono al final
        icon: Icon(Icons.email)//icono al principio
      ),

  onChanged: (valor)=>  setState(() { // para que se actualice siempre
      _email=valor; //se iguala el email al valor creado
    })

    );

  }


  Widget _crearPassword(){
    return TextField(
      obscureText: true,

      decoration: InputDecoration(//decoracion en el input

        border: OutlineInputBorder( //borde
          borderRadius: BorderRadius.circular(20.0),
        ),

        hintText: 'Password', //ejemplo de que escribir
        labelText: 'Email',
        suffixIcon: Icon(Icons.lock),//icono al final
        icon: Icon(Icons.lock)//icono al principio
      ),

  onChanged: (valor)=>  setState(() { // para que se actualice siempre
      _email=valor; //se iguala el email al valor creado
    })

    );


  }


  Widget _crearFecha(BuildContext context){
    

    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateControll,
      decoration: InputDecoration(//decoracion en el input

        border: OutlineInputBorder( //borde
          borderRadius: BorderRadius.circular(20.0),
        ),

        hintText: 'Fecha de nacimiento', //ejemplo de que escribir
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),//icono al final
        icon: Icon(Icons.calendar_today)//icono al principio
      ),
      onTap: (){

        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);

      },

    );

  }

  _selectDate(BuildContext context) async{
    
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2025),
      locale: Locale('es','ES')
    );

    if (picked != null){
      setState(() {
        _fecha= picked.toString();
        _inputFieldDateControll.text= _fecha;
      });

    }

  }

  List<DropdownMenuItem<String>> getOpcionesDropdown(){
    List<DropdownMenuItem<String>> lista =new List();

    _poderes.forEach((poder) { 

      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));

    });

    return lista;

  }

  Widget _crearDropdown(){
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 20.0,),
        DropdownButton(
          value: _opcionesSeleccionada,
          items: getOpcionesDropdown(),
          onChanged: (opt){
            setState(() {
              _opcionesSeleccionada = opt;
            });
          },
        )

      ],
    );
    
    
    
  }
}