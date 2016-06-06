using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BazyZadania {
    public partial class Zadanie12 : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e) {
            if (e.CommandName == "cmdAdd") {
                CitiesDataSource2.Insert();
            }
        }

        protected void CitiesDataSource_Inserting(object sender, SqlDataSourceCommandEventArgs e) {
            var tbCityName = GridView1.FooterRow.FindControl("inputCityName") as TextBox;
            var tbCityShortName = GridView1.FooterRow.FindControl("inputCityShortName") as TextBox;
            e.Command.Parameters["@name"].Value = tbCityName.Text;
            e.Command.Parameters["@shortName"].Value = tbCityShortName.Text;
        }

        protected void UsersDataSource2_Inserting(object sender, SqlDataSourceCommandEventArgs e) {
            var firstName = GridView2.FooterRow.FindControl("inputUserFirstName") as TextBox;
            var lastName = GridView2.FooterRow.FindControl("inputUserLastName") as TextBox;
            var age = GridView2.FooterRow.FindControl("inputUserAge") as TextBox;
            var username = GridView2.FooterRow.FindControl("inputUserUsername") as TextBox;
            var city = GridView2.FooterRow.FindControl("inputUserCity") as DropDownList;
            e.Command.Parameters["@firstName"].Value = firstName.Text;
            e.Command.Parameters["@lastName"].Value = lastName.Text;
            e.Command.Parameters["@age"].Value = int.Parse(age.Text) | 0;
            e.Command.Parameters["@username"].Value = username.Text;
            e.Command.Parameters["@id_city"].Value = int.Parse(city.SelectedValue) | 0;
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e) {
            if (e.CommandName == "cmdAdd") {
                UsersDataSource2.Insert();
            }
        }
        
    }
}