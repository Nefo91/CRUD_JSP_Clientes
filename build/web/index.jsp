<%-- 
    Document   : index
    Created on : 30/09/2021, 23:49:52
    Author     : Nefi Morales
--%>
<%@page import="modelo.Cliente" %>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page import="java.util.HashMap" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    </head>
    <body>
        <h1> ** Formulario de Clientes ** </h1>
        <div class="container">
            <form action="sr_cliente" method="post" class="form-group">
                <label for="lbl_id"><b>ID</b></label>
                <input type="text" name="txt_id" id="txt_id" class="form-control" readonly>
                
                <label for="lbl_nit"><b>Nit</b></label>
                  <input type="text" name="txt_nit" id="txt_nit" class="form-control" placeholder="Ejemplo: 1111111-1" required>
                
                <label for="lbl_nombres"><b>Nombres</b></label>
                  <input type="text" name="txt_nombres" id="txt_nombres" class="form-control" placeholder="Ejemplo: Vicente " required>
                                               
                  <label for="lbl_apellidos"><b>Apellidos</b></label>
                  <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder="Ejemplo: Fernandez " required>
                  
                  <label for="lbl_direccion"><b>Direccion</b></label>
                  <input type="text" name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: 2da Calle, Zona 13, Guatemala" required>
                  
                  <label for="lbl_telefono"><b>Telefono</b></label>
                  <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 5893-5489" required>
                  
                  <label for="lbl_fn"><b>Nacimiento</b></label>
                  <input type="date" name="txt_fn" id="txt_fn" class="form-control" required>
                  
                  <br>
                  <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-success btn-lg" >Agregar</button>
                  <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-primary btn-lg" >Modificar</button>
                  <button name="btn_eliminar" id="btn_eliminar"  value="eliminar" class="btn btn-danger btn-lg" >Eliminar</button>
                
            </form>
                  <br>
    <table class="table table-hover">
    <thead>
      <tr>
        <th>Nit</th>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
        <th>Nacimiento</th>
      </tr>
    </thead>
    <tbody id="tbl_clientes">
        <%
            Cliente cliente = new Cliente();
            DefaultTableModel tabla = new DefaultTableModel();
            tabla = cliente.leer();
            for (int t=0;t<tabla.getRowCount();t++){
                out.println("<tr data-id=" + tabla.getValueAt(t, 0) + ">");
                out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                out.println("</tr>");
            }
        %>
    </tbody>
  </table>
        </div>
        
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
  
<script type="text/javascript">
    $('#tbl_clientes').on('click','tr td',function(evt){
       var target, id,nit,nombres,apellidos,direccion,telefono,nacimiento;
       target = $(event.target);
       id = target.parent().data('id');
       nit = target.parent("tr").find("td").eq(0).html();
       nombres = target.parent("tr").find("td").eq(1).html();
       apellidos = target.parent("tr").find("td").eq(2).html();
       direccion = target.parent("tr").find("td").eq(3).html();
       telefono = target.parent("tr").find("td").eq(4).html();
       nacimiento = target.parent("tr").find("td").eq(5).html();
       $("#txt_id").val(id);
       $("#txt_nit").val(nit);
       $("#txt_nombres").val(nombres);
       $("#txt_apellidos").val(apellidos);
       $("#txt_direccion").val(direccion);
       $("#txt_telefono").val(telefono);
       $("#txt_fn").val(nacimiento);
    });
</script>

    </body>
</html>
