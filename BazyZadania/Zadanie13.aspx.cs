using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BazyZadania {
    public partial class Zadanie13 : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                //setUsersFromSelectedCity();
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e) {

            if (e.CommandName == "Insert") {
                var footerRow = GridView2.FooterRow;
                var NewName = (TextBox)footerRow.FindControl("NewName");
                var NewShortName = (TextBox)footerRow.FindControl("NewShortName");


                ObjectDataSource2.InsertParameters.Clear();
                ObjectDataSource2.InsertParameters.Add("name", NewName.Text);
                ObjectDataSource2.InsertParameters.Add("shortname", NewShortName.Text);
                ObjectDataSource2.Insert();
            }

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e) {
            if (e.CommandName == "Insert") {
                var footerRow = GridView1.FooterRow;
                var NewFirstName = (TextBox)footerRow.FindControl("NewFirstName");
                var NewLastName = (TextBox)footerRow.FindControl("NewLastName");
                var NewAge = (TextBox)footerRow.FindControl("NewAge");
                var NewUsername = (TextBox)footerRow.FindControl("NewUsername");
                var DropDownList2 = (DropDownList)footerRow.FindControl("DropDownList2");




                ObjectDataSource1.InsertParameters.Clear();
                ObjectDataSource1.InsertParameters.Add("firstName", NewFirstName.Text);
                ObjectDataSource1.InsertParameters.Add("lastName", NewLastName.Text);
                ObjectDataSource1.InsertParameters.Add("age", System.Data.DbType.Int32, NewAge.Text);
                ObjectDataSource1.InsertParameters.Add("username", NewUsername.Text);
                ObjectDataSource1.InsertParameters.Add("id_city", DropDownList2.SelectedValue.ToString());
                ObjectDataSource1.Insert();

                setUsersFromSelectedCity();
            }
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e) {
            setUsersFromSelectedCity();
        }

        private void setUsersFromSelectedCity() {
            ObjectDataSource1.SelectParameters.Clear();

            if (DropDownList3.SelectedValue.ToString() != "-1") {
                ObjectDataSource1.SelectParameters.Add("id_city", DropDownList3.SelectedValue.ToString());
            }
            
            ObjectDataSource1.Select();
            GridView1.DataBind();
            GridView1.ShowFooter = true;

            if (GridView1.Rows.Count <= 0) {

                ObjectDataSource1.SelectMethod = "users_select_all_empty";
                ObjectDataSource1.SelectParameters.Clear();
                ObjectDataSource1.Select();
                GridView1.DataBind();
                GridView1.Rows[0].Visible = false;

            }
        }

        protected void DropDownList3_DataBinding(object sender, EventArgs e) {
            DropDownList3.Items.Insert(0, new ListItem("(Wszystko)", "-1"));
            setUsersFromSelectedCity();
        }

    }
}