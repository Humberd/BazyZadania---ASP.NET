using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace BazyZadania {
    public class Zadanie13UsersDB {

        private string connectionString;

        public Zadanie13UsersDB() {
            this.connectionString = WebConfigurationManager.ConnectionStrings["MBase"].ConnectionString;
        }

        public List<Zadanie13UserDetails> user_select_all() {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand("user_select_all_view", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            List<Zadanie13UserDetails> result = new List<Zadanie13UserDetails>();
            try {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read()) {
                    Zadanie13UserDetails user = new Zadanie13UserDetails((int)reader["id"], (string)reader["firstName"], (string)reader["lastName"], (int)reader["age"], (string)reader["username"], (int)reader["id_city"], (string)reader["name"]);
                    result.Add(user);
                }

            } catch (SqlException ex) {
                throw new ApplicationException("Cannot read from database");
            } finally {
                connection.Close();
            }

            return result;
        }

        public List<Zadanie13UserDetails> user_select_all(int id_city) {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand("user_select_all_view", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            List<Zadanie13UserDetails> result = new List<Zadanie13UserDetails>();
            try {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read()) {
                    Zadanie13UserDetails user = new Zadanie13UserDetails((int)reader["id"], (string)reader["firstName"], (string)reader["lastName"], (int)reader["age"], (string)reader["username"], (int)reader["id_city"], (string)reader["name"]);
                    if (user.id_city == id_city) {
                        result.Add(user);
                    }
                }

            } catch (SqlException ex) {
                throw new ApplicationException("Cannot read from database");
            } finally {
                connection.Close();
            }

            return result;
        }

        public void users_delete(int id) {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand("users_delete", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add(getParameter("@id", id, command));
            try {
                connection.Open();
                command.ExecuteNonQuery();
            } catch (SqlException ex) {
                throw new ApplicationException("Cannot read from database");
            } finally {
                connection.Close();
            }
        }

        public void users_update(int id, string firstName, string lastName, int age, string username, int id_city, string name) {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand("users_update_2", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add(getParameter("@id", id, command));
            command.Parameters.Add(getParameter("@firstName", firstName, command));
            command.Parameters.Add(getParameter("@lastName", lastName, command));
            command.Parameters.Add(getParameter("@age", age, command));
            command.Parameters.Add(getParameter("@username", username, command));
            command.Parameters.Add(getParameter("@id_city", id_city, command));
            try {
                connection.Open();
                command.ExecuteNonQuery();
            } catch (SqlException ex) {
                throw new ApplicationException("Cannot read from database");
            } finally {
                connection.Close();
            }
        }

        public void users_insert(string firstName, string lastName, int age, string username, int id_city) {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand("users_insert_2", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add(getParameter("@firstName", firstName, command));
            command.Parameters.Add(getParameter("@lastName", lastName, command));
            command.Parameters.Add(getParameter("@age", age, command));
            command.Parameters.Add(getParameter("@username", username, command));
            command.Parameters.Add(getParameter("@id_city", id_city, command));
            try {
                connection.Open();
                command.ExecuteNonQuery();
            } catch (SqlException ex) {
                throw new ApplicationException("Cannot read from database");
            } finally {
                connection.Close();
            }
        }

        public List<Zadanie13UserDetails> users_select_all_empty() {
            List<Zadanie13UserDetails> usersList = new List<Zadanie13UserDetails>();


            Zadanie13UserDetails ud = new Zadanie13UserDetails(-1, "", "", 0, "", 0, "");
            ud.id = 0;
            usersList.Add(ud);


            return usersList;
        }

        ///////////////////////////////////////////////

        private DbParameter getParameter(string name, object value, SqlCommand command) {
            DbParameter param = command.CreateParameter();
            param.ParameterName = name;
            param.Value = value;
            return param;
        }
    }
}