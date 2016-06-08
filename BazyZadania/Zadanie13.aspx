<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zadanie13.aspx.cs" Inherits="BazyZadania.Zadanie13" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <style>
            #cont {
                margin: 30px 50px;
            }
            #dropDownList {
                margin: 20px 0;
                width: 200px;
            }
        </style>
        <div id="cont">
            <div id="dropDownList">
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="ObjectDataSource2" 
                    DataTextField="Name" DataValueField="Id" CssClass="form-control" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="True"
                    OnDataBound="DropDownList3_DataBinding">
                    <%--<asp:ListItem Selected="True" Value="-1">(Wszystkie)</asp:ListItem>--%>
                </asp:DropDownList>
            </div>
            <div class="row">
                <div class="col-md-7">
                    <asp:GridView ID="GridView1" EmptyDataText="No data available." ShowFooterWhenEmpty="true" ShowHeaderWhenEmpty="true" runat="server" AutoGenerateColumns="False"
                        DataSourceID="ObjectDataSource1" ShowFooter="True" OnRowCommand="GridView1_RowCommand" CssClass="table">
                        <Columns>
                            <asp:TemplateField HeaderText="id" SortExpression="id" Visible="true">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="firstName" SortExpression="firstName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("firstName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("firstName") %>'></asp:Label>
                                </ItemTemplate>

                                <FooterTemplate>

                                    <asp:TextBox ID="NewFirstName" runat="server"></asp:TextBox>

                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="lastName" SortExpression="lastName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("lastName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("lastName") %>'></asp:Label>
                                </ItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="NewLastName" runat="server"></asp:TextBox>

                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="age" SortExpression="age">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("age") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                                </ItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="NewAge" runat="server"></asp:TextBox>

                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="username" SortExpression="username">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                                </ItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="NewUsername" runat="server"></asp:TextBox>

                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="id_city" SortExpression="id_city" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("id_city") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("id_city") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City" SortExpression="name">
                                <EditItemTemplate>
                                    <asp:Panel runat="server">
                                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%#Bind("id_city")%>' DataValueField="id" DataTextField="name" DataSourceID="ObjectDataSource2">
                                        </asp:DropDownList>
                                    </asp:Panel>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>

                                <FooterTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataValueField="id" DataTextField="name" DataSourceID="ObjectDataSource2" />

                                </FooterTemplate>

                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="" CssClass="btn btn-success btn-sm glyphicon glyphicon-ok"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="" CssClass="btn btn-danger btn-sm glyphicon glyphicon-remove"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="" CssClass="btn btn-primary btn-sm glyphicon glyphicon-edit"></asp:LinkButton>
                                </ItemTemplate>


                                <FooterTemplate>

                                    <asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="True" CommandName="Insert" Text="" CssClass="glyphicon glyphicon-plus btn btn-success btn-sm"></asp:LinkButton>
                                </FooterTemplate>
                            </asp:TemplateField>


                        </Columns>

                    </asp:GridView>
                </div>
                <div class="col-md-offset-1 col-md-4">
                    <asp:GridView ID="GridView2" runat="server" ShowFooter="True" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" OnRowCommand="GridView2_RowCommand" CssClass="table">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="" CssClass="btn btn-success btn-sm glyphicon glyphicon-ok"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="" CssClass="btn btn-danger btn-sm glyphicon glyphicon-remove"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="" CssClass="btn btn-primary btn-sm glyphicon glyphicon-edit"></asp:LinkButton>
                                </ItemTemplate>
                                <FooterTemplate>

                                    <asp:LinkButton ID="LinkButton6" runat="server" CausesValidation="True" CommandName="Insert" Text="" CssClass="glyphicon glyphicon-plus btn btn-success btn-sm"></asp:LinkButton>
                                </FooterTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Id" SortExpression="Id">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="NewName" runat="server"></asp:TextBox>

                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ShortName" SortExpression="ShortName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ShortName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ShortName") %>'></asp:Label>
                                </ItemTemplate>

                                <FooterTemplate>
                                    <asp:TextBox ID="NewShortName" runat="server"></asp:TextBox>

                                </FooterTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="users_delete" InsertMethod="users_insert" SelectMethod="user_select_all" TypeName="BazyZadania.Zadanie13UsersDB" UpdateMethod="users_update">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList3" Name="id_city" PropertyName="SelectedValue" Type="Int32"/>
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="firstName" Type="String" />
                <asp:Parameter Name="lastName" Type="String" />
                <asp:Parameter Name="age" Type="Int32" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="id_city" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="firstName" Type="String" />
                <asp:Parameter Name="lastName" Type="String" />
                <asp:Parameter Name="age" Type="Int32" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="id_city" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" InsertMethod="cities_insert" SelectMethod="cities_select_all" TypeName="BazyZadania.Zadanie13CitiesDB" UpdateMethod="cities_update" DeleteMethod="cities_delete">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="shortname" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="shortname" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
