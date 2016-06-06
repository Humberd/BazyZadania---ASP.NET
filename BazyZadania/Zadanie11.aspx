<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zadanie11.aspx.cs" Inherits="BazyZadania.Zadanie11" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/bootstrap-theme.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
    <title></title>
    <style>
        #add-row {
            margin: 10px 0px;
        }
        .my-table {
            border-top: 2px solid black;
        }
    </style>
    <script type="text/javascript">
        function showEditForm() {
            $("#editModal").modal();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div id="add-row">
                <button class="btn btn-success" type="button" data-toggle="modal" data-target="#myModal">
                    <span class="glyphicon glyphicon-plus"></span>Add
                </button>
            </div>
            <asp:GridView ID="gridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover my-table"
                OnSelectedIndexChanged="gridView1_SelectedIndexChanged" OnRowDeleting="gridView1_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" />
                    <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                    <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                    <asp:BoundField DataField="age" HeaderText="Age" SortExpression="age" />
                    <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                    <asp:CommandField ButtonType="Link" ShowCancelButton="False" ShowSelectButton="True" SelectText="">
                        <ControlStyle CssClass="glyphicon glyphicon-edit btn btn-primary" />
                        <ItemStyle Width="10px" />
                    </asp:CommandField>
                    <asp:CommandField ButtonType="Link" ShowDeleteButton="True" DeleteText="">
                        <ControlStyle CssClass="glyphicon glyphicon-trash btn btn-danger" />
                        <ItemStyle Width="10px" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">New User</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>First Name</label>
                                <asp:TextBox ID="inputFirstName" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Last Name</label>
                                <asp:TextBox ID="inputLastName" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Age</label>
                                <asp:TextBox ID="inputAge" runat="server" Text="" TextMode="Number" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>UserName</label>
                                <asp:TextBox ID="inputUsername" runat="server" Text="" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <asp:Button ID="saveButton" runat="server" Text="Save Changes" CssClass="btn btn-primary" OnClick="saveButton_Click" />
                            <%--<button type="button" class="btn btn-primary">Save changes</button>--%>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="editModalLabel">Edit User: 
                                <span runat="server" id="editId" class="h3"><%# selectedUser.id %></span>
                            </h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                <label>First Name</label>
                                <asp:TextBox ID="editFirstName" runat="server" Text="<%# selectedUser.firstName %>" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Last Name</label>
                                <asp:TextBox ID="editLastName" runat="server" Text="<%# selectedUser.lastName %>" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Age</label>
                                <asp:TextBox ID="editAge" runat="server" Text="<%# selectedUser.age %>" TextMode="Number" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>UserName</label>
                                <asp:TextBox ID="editUsername" runat="server" Text="<%# selectedUser.username %>" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <asp:Button ID="editSaveButton" runat="server" Text="Save Changes" CssClass="btn btn-primary" OnClick="editSaveButton_Click"/>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
