<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Zadanie12.aspx.cs" Inherits="BazyZadania.Zadanie12" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div class="containerf">
            <div class="row">
                <div class="col-md-4">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id"
                        DataSourceID="CitiesDataSource2" OnRowCommand="GridView1_RowCommand" CssClass="table" ShowFooter="True">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Button ID="addCityButton" runat="server" CommandName="cmdAdd" Text="Add" />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                            <asp:TemplateField HeaderText="name" SortExpression="name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="inputCityName" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="shortName" SortExpression="shortName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("shortName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="inputCityShortName" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("shortName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div class="col-md-offset-1 col-md-6">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="Id" 
                        DataSourceID="UsersDataSource2" ShowFooter="True" OnRowCommand="GridView2_RowCommand">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:Button ID="userAddButton" runat="server" CommandName="cmdAdd" Text="Add" />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" Visible="False" />
                            <asp:TemplateField HeaderText="firstName" SortExpression="firstName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("firstName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="inputUserFirstName" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("firstName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="lastName" SortExpression="lastName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("lastName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="inputUserLastName" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("lastName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="age" SortExpression="age">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("age") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="inputUserAge" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("age") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="username" SortExpression="username">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="inputUserUsername" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="City" SortExpression="name">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("id_city") %>' DataSourceID="CitiesDataSource2" DataTextField="name" DataValueField="Id">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="inputUserCity" runat="server" DataSourceID="CitiesDataSource2" DataTextField="name" DataValueField="Id">
                                    </asp:DropDownList>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>



        <asp:SqlDataSource ID="CitiesDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MBaseConnectionString %>"
            DeleteCommand="cities_delete" DeleteCommandType="StoredProcedure" InsertCommand="cities_insert"
            InsertCommandType="StoredProcedure" SelectCommand="city_select_all" SelectCommandType="StoredProcedure"
            UpdateCommand="cities_update" UpdateCommandType="StoredProcedure"
            OnInserting="CitiesDataSource_Inserting">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="shortName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="name" Type="String" />
                <asp:Parameter Name="shortName" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="UsersDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MBaseConnectionString %>" DeleteCommand="users_delete" DeleteCommandType="StoredProcedure" InsertCommand="users_insert_2" InsertCommandType="StoredProcedure" SelectCommand="user_select_all_view" SelectCommandType="StoredProcedure" UpdateCommand="users_update_2" UpdateCommandType="StoredProcedure"
            OnInserting="UsersDataSource2_Inserting">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="firstName" Type="String" />
                <asp:Parameter Name="lastName" Type="String" />
                <asp:Parameter Name="age" Type="Int32" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="id_city" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="id" Type="Int32" />
                <asp:Parameter Name="firstName" Type="String" />
                <asp:Parameter Name="lastName" Type="String" />
                <asp:Parameter Name="age" Type="Int32" />
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="id_city" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
