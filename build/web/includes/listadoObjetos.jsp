                                                <%@page import="java.util.Iterator"%>
                                                <%@page import="ModeloDAO.ObjetoDAO"%>
                                                <%@page import="ModeloVO.ObjetoVO"%>
                                                <%@page import="java.util.ArrayList"%>


                                                <table class="table ucp-table earning__table" style="width: 100%;">
                                                    <thead class="thead-s" style="color: #09003E;">
                                                        <tr>
                                                        <th scope="col">Nombre</th>
                                                        <th scope="col">Peso</th>
                                                        <th scope="col">Tamaño</th>
                                                        <th scope="col">Descripcion</th>
                                                        <th scope="col">Modificar</th>
                                                        <th scope="col">Eliminar</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                        <%
                                                            ArrayList<ObjetoVO> Listado = new ArrayList<ObjetoVO>();
                                                            ObjetoVO ObVO = new ObjetoVO();
                                                            ObjetoDAO obDAO = new ObjetoDAO(ObVO);

                                                            if(obDAO.List(EnvioID)!= null){
                                                               Listado = obDAO.List(EnvioID);
                                                               Iterator<ObjetoVO> Iter = Listado.iterator();
                                                               while(Iter.hasNext()){                        
                                                                   ObjetoVO veh = Iter.next();
                                                        %>

                                                      <tr>
                                                        <td><%= veh.getNombre()%></td>
                                                        <td><%= veh.getPeso()%></td>
                                                        <td><%= veh.getTam()%></td>
                                                        <td style="overflow: auto"><%= veh.getDescripcion()%></td>
                                                        <td> <a style="background-color: #005AAF;" class="upload_btn" href="updateObjeto.jsp?ObjID=<%= veh.getObjetoID()%>&EnvioID=<%= EnvioID %>"><i class="uil uil-edit-alt"></i></a> </td>
                                                        <td> 
                                                            <form action="Objeto" method="POST">
                                                                <input type="hidden" name="ObjID" value="<%= veh.getObjetoID() %>">
                                                                <input type="hidden" name="EnvioID" value="<%= EnvioID %>">
                                                                <input type="hidden" name="opcion" value="2">
                                                                <button id="singlebutton" name="singlebutton"  class="upload_btn"><i class="uil uil-trash-alt"></i></button>
                                                             </form>
                                                        </td>
                                                      </tr>

                                                      <%            
                                                               }
                                                            }
                                                       %>

                                                    </tbody>
                                                      <tfoot style="background-color: #545654;">
                                                        <tr>
                                                            <td colspan="6">Listado de  Objetos</td>
                                                        </tr>
                                                      </tfoot>
                                                  </table>

