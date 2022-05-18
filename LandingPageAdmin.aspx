<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAfterLogin.master" Debug="true" CodeFile="LandingPageAdmin.aspx.cs" Inherits="LandingPageAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
         <div class="row mt-2">
            <div class="col-md-12 row">
                <div class="col-md-6 text-center">
                    <asp:Button ID="ButtonAddUser" runat="server" Text="Add User" CssClass="btn btn-outline-info btn-sm"
                        OnClick="ButtonAddUser_OnClick" />
                </div>
                <div class="col-md-6 text-center">
                    <asp:Button ID="ButtonViewReport" runat="server" Text="View Report" CssClass="btn btn-outline-info btn-sm"
                        Visible="true" />
                </div>
            </div>
        </div>
        </div>
        
</asp:Content>

