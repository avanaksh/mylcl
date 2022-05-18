<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAfterLogin.master" Debug="true"
    CodeFile="LandingPage.aspx.cs" Inherits="LandingPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    --%></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="divtoast" class="container mt-2" runat="server" visible="false">
        <!--show toast -->
        <div aria-live="polite" aria-atomic="true" class="d-flex justify-content-center align-items-center"
            style="min-height: 0px;">
            <div class="card shadow">
                <div class="toast" id="mytoast" role="alert" aria-live="polite" aria-atomic="true"
                    data-delay="5000">
                    <div class="toast-body bg-dark text-white">
                        <asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
            </div>
            <!--end of show toast -->
        </div>
    </div>
    <div class="container shadow">
        <div class="row">
            <div class="col-md-12 row mt-1">
                <div class="col-md-12 text-center">
                    <label for="name" class="control-label">
                        <h2>
                            <font color="midnightblue" face="Trebuchet MS">
                           </font>
                        </h2>
                    </label>
                    <div class="panel panel-default bg-success ">
                        <div class="panel-body">
                            <h2 class="text-white">
                                Hello, User
                                <%=instname %></h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 row">
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                Name</h6>
                            <p class="card-text">
                                <asp:Label ID="lblname" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                Address</h6>
                            <p class="card-text">
                                <asp:Label ID="lbladdress" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                State</h6>
                            <p class="card-text">
                                <asp:Label ID="lblstate" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                District</h6>
                            <p class="card-text">
                                <asp:Label ID="lbldistrict" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 row">
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                City</h6>
                            <p class="card-text">
                                <asp:Label ID="lblcity" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                Pincode</h6>
                            <p class="card-text">
                                <asp:Label ID="lblpincode" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                Phone</h6>
                            <p class="card-text">
                                <asp:Label ID="lblphone" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                Fax</h6>
                            <p class="card-text">
                                <asp:Label ID="lblfax" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 row">
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                Email</h6>
                            <p class="card-text">
                                <asp:Label ID="lblemail" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                Web address</h6>
                            <p class="card-text">
                                <asp:Label ID="lblwebaddress" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                Nodal contact email</h6>
                            <p class="card-text">
                                <asp:Label ID="lblnodalcntemail" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                SMD name</h6>
                            <p class="card-text">
                                <asp:Label ID="lblsmdname" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 row">
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                Longitude</h6>
                            <p class="card-text">
                                <asp:Label ID="lbllongitude" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                Latitude</h6>
                            <p class="card-text">
                                <asp:Label ID="lbllatitude" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                Short abbrevia</h6>
                            <p class="card-text">
                                <asp:Label ID="lblshortabrevia" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 shadow">
                    <div class="card mt-2 bg-success" style="width: 16rem; height: 150px">
                        <div class="card-body">
                            <h6 class="card-title text-white">
                                Organization type</h6>
                            <p class="card-text">
                                <asp:Label ID="lblorgtype" runat="server" Text="Label" CssClass="label_color"></asp:Label></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-2 mb-2">
            <div class="col-md-12 row">
                <div class="col-md-3">
                </div>
                <div class="col-md-6 text-center">
                    <asp:LinkButton ID="ButtonEditUpdate" runat="server" Text="Edit/Update Details" CssClass="btn btn-outline-info btn-sm"
                         OnClick="ButtonEditUpdate_OnClick" />
                </div>
                <div class="col-md-3">
                </div>
            </div>
        </div>
        <!-- Modal -->
      <%--  <a href="LandingPage.aspx">LandingPage.aspx</a>--%>
        <div class="modal fade bd-example-modal-lg" id="exampleModalScrollable" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header text-white bg-success" style="height: 50px;">
                        <h5 class="modal-title text-white" id="exampleModalScrollableTitle">
                            Update/Edit Details</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12 row">
                                    <div class="col-md-3">
                                        <label>
                                            Name<label></div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtName" runat="server" Width="150px"></asp:TextBox></div>
                                    <div class="col-md-3">
                                        <label>
                                            Address<label></div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtAddress" runat="server" Width="150px"></asp:TextBox></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 row">
                                    <div class="col-md-3">
                                        <label>
                                            State<label></div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtState" runat="server" Width="150px"></asp:TextBox></div>
                                    <div class="col-md-3">
                                        <label>
                                            District<label></div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtDistrict" runat="server" Width="150px"></asp:TextBox></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 row">
                                    <div class="col-md-3">
                                        <label>
                                            City<label></div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtCity" runat="server" Width="150px"></asp:TextBox></div>
                                    <div class="col-md-3">
                                        <label>
                                            Pincode<label></div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtPincode" runat="server" Width="150px"></asp:TextBox></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 row">
                                    <div class="col-md-3">
                                        <label>
                                            Phone<label></div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtPhone" runat="server" Width="150px"></asp:TextBox></div>
                                    <div class="col-md-3">
                                        <label>
                                            Fax<label></div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtFax" runat="server" Width="150px"></asp:TextBox></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 row">
                                    <div class="col-md-3">
                                        <label>
                                            Email<label></div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtEmail" runat="server" Width="150px"></asp:TextBox></div>
                                    <div class="col-md-3">
                                        <label>
                                            Web Address<label></div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtWebaddress" runat="server" Width="150px"></asp:TextBox></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 row">
                                    <div class="col-md-3">
                                        <label>
                                            Nodal contact email<label></div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtNodalcntemail" runat="server" Width="150px"></asp:TextBox></div>
                                    <div class="col-md-3">
                                        <label>
                                            SMD Name<label></div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtSmdname" runat="server" Width="150px"></asp:TextBox></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 row">
                                    <div class="col-md-3">
                                        <label>
                                            Longitude<label></div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtLongitude" runat="server" Width="150px"></asp:TextBox></div>
                                    <div class="col-md-3">
                                        <label>
                                            Latitude<label></div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtLatitude" runat="server" Width="150px"></asp:TextBox></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12 row">
                                    <div class="col-md-3">
                                        <label>
                                            Short Abbrevia<label></div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtShortabrevia" runat="server" Width="150px"></asp:TextBox></div>
                                    <div class="col-md-3">
                                        <label>
                                            Organization Type<label></div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddlOrgtype" runat="server" Width="150px">
                                        </asp:DropDownList>
                                       <%-- <asp:TextBox ID="txtOrgtype" runat="server" Width="100px"></asp:TextBox>--%>
                                      <%--  <a href="" data-toggle="modal" style="height:35px;text-decoration:none" data-target="#exampleModal">View</a>--%>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">
                            Close</button>
                       <%-- <button type="button" class="btn btn-primary">
                            Save changes</button>--%>
                            <asp:LinkButton ID="LinkButtonSave" runat="server" Text="Save" CssClass="btn btn-outline-info btn-sm"
                         OnClick="LinkButtonSave_OnClick" />
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 row">
                <div class="col-md-6 text-center">
                    <asp:Button ID="ButtonFillForm" runat="server" Text="Fill Form" CssClass="btn btn-outline-info btn-sm"
                        OnClick="ButtonFillForm_OnClick" />
                </div>
                <div class="col-md-6 text-center">
                    <asp:Button ID="ButtonViewForm" runat="server" Text="View Form" CssClass="btn btn-outline-info btn-sm"
                        OnClick="ButtonViewForm_OnClick" />
                </div>
            </div>
        </div>
        <!--Modal Forgot Password -->
 <div class="modal fade bd-example-modal-md" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-md" role="document">
    <div class="modal-content bg-light text-dark">
      <div class="modal-header bg-success " style="height:50px">
        <h5 class="modal-title text-white" id="exampleModalLabel">Organization type</h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
     <%-- <h2 class="text-center bg-light text-dark">Forgot Password</h2>--%>
        <div class="container-fluid">
    <div class="col-md-12 row">
   <table class="table">
  <thead class="thead-dark">
    <tr>
    
      <th scope="col">Organization Id</th>
      <th scope="col">Organization Type</th>
      
    </tr>
  </thead>
  <tbody>
    <tr>
      
      <td>1</td>
      <td>Institute</td>
     
    </tr>
    <tr>
      
      <td>2</td>
      <td>Regional Station</td>
    
    </tr>
    <tr>
    
      <td>3</td>
      <td>ATARI</td>
    
    </tr>
    <tr>
     
      <td>4</td>
      <td>Deemed University</td>
    
    </tr>
      <tr>
     
      <td>5</td>
      <td>Project Directorate</td>
    
    </tr>
    <tr>
     
      <td>6</td>
      <td>National Bureau</td>
    
    </tr>
     <tr>
      
      <td>7</td>
      <td>National Research Centre</td>
    
    </tr>
  </tbody>
</table>
   <%-- <div class="col-md-6">
    <h5><label for="" class="bg-light text-dark">Email</label></h5>    
    </div>
    <div class="col-md-3">
       
    </div>
     <div class="col-md-3"></div>
    </div>--%>
    </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">
                                Close</button>

      </div>
    </div>
  </div>  
</div>
    <!--End of Forgot Password -->
    </div>
    </div>

</asp:Content>
