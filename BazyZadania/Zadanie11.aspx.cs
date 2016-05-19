using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BazyZadania {
    public partial class Zadanie11 : System.Web.UI.Page {

        private UsersDB db;

        public UserDetails selectedUser;
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                db = new UsersDB();
                gridView1.DataSource = db.user_select_all();
                gridView1.DataBind();
            }
        }

        protected void gridView1_SelectedIndexChanged(object sender, EventArgs e) {
            UsersDB tempDB = new UsersDB();
            selectedUser = tempDB.users_select_by_id(int.Parse(gridView1.Rows[gridView1.SelectedIndex].Cells[0].Text));
            ScriptManager.RegisterStartupScript(this, typeof(Page), "UpdateMsg", "$(document).ready(showEditForm());", true);
            editFirstName.DataBind();
            editLastName.DataBind();
            editAge.DataBind();
            editUsername.DataBind();
            editId.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e) {
            UsersDB tempDB = new UsersDB();
            tempDB.users_insert(inputFirstName.Text, inputLastName.Text, int.Parse(inputAge.Text), inputUsername.Text);
            gridView1.DataSource = tempDB.user_select_all();
            gridView1.DataBind();
            clearInputs();
        }

        private void setInputs(string firstName, string lastName, string age, string username) {
            inputFirstName.Text = firstName;
            inputLastName.Text = lastName;
            inputAge.Text = age;
            inputUsername.Text = username;
        }

        private void clearInputs() {
            setInputs("", "", "", "");
        }

        protected void gridView1_RowDeleting(object sender, GridViewDeleteEventArgs e) {
            UsersDB tempDB = new UsersDB();
            string id = gridView1.Rows[e.RowIndex].Cells[0].Text;
            tempDB.users_delete(int.Parse(id));
            gridView1.DataSource = tempDB.user_select_all();
            gridView1.DataBind();
        }

        protected void editSaveButton_Click(object sender, EventArgs e) {
            UsersDB tempDB = new UsersDB();
            tempDB.users_update(int.Parse(editId.InnerText), editFirstName.Text, editLastName.Text, int.Parse(editAge.Text), editUsername.Text);
            gridView1.DataSource = tempDB.user_select_all();
            gridView1.DataBind();
        }
    }
}