using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace BazyZadania {

    public class UsersDB {

        private string connectionString;

        public UsersDB(string connectionString) {
            this.connectionString = connectionString;
        }

        public UsersDB() {
            this.connectionString = WebConfigurationManager.ConnectionStrings["MBase"].ConnectionString;
        }

        public List<UserDetails> user_select_all() {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand("user_select_all", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;

            List<UserDetails> result = new List<UserDetails>();
            try {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                while (reader.Read()) {
                    UserDetails user = new UserDetails((int)reader["id"], (string) reader["firstName"], (string) reader["lastName"], (int) reader["age"], (string) reader["username"]);
                    result.Add(user);
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

        public UserDetails users_select_by_id(int id) {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand("users_select_by_id", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add(getParameter("@id", id, command));
            UserDetails user;
            try {
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.HasRows) {
                    reader.Read();
                    user = new UserDetails((int)reader["id"], (string)reader["firstName"], (string)reader["lastName"], (int)reader["age"], (string)reader["username"]);
                    return user;
                } else {
                    return null;
                }

            } catch (SqlException ex) {
                throw new ApplicationException("Cannot read from database");
            } finally {
                connection.Close();
            }
        }

        public void users_update(int id, string firstName, string lastName, int age, string username) {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand("users_update", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add(getParameter("@id", id, command));
            command.Parameters.Add(getParameter("@firstName", firstName, command));
            command.Parameters.Add(getParameter("@lastName", lastName, command));
            command.Parameters.Add(getParameter("@age", age, command));
            command.Parameters.Add(getParameter("@username", username, command));
            try {
                connection.Open();
                command.ExecuteNonQuery();
            } catch (SqlException ex) {
                throw new ApplicationException("Cannot read from database");
            } finally {
                connection.Close();
            }
        }

        public void users_insert(string firstName, string lastName, int age, string username) {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand("users_insert", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.Parameters.Add(getParameter("@firstName", firstName, command));
            command.Parameters.Add(getParameter("@lastName", lastName, command));
            command.Parameters.Add(getParameter("@age", age, command));
            command.Parameters.Add(getParameter("@username", username, command));
            try {
                connection.Open();
                command.ExecuteNonQuery();
            } catch (SqlException ex) {
                throw new ApplicationException("Cannot read from database");
            } finally {
                connection.Close();
            }
        }

        private DbParameter getParameter(string name, object value, SqlCommand command) {
            DbParameter param = command.CreateParameter();
            param.ParameterName = name;
            param.Value = value;
            return param;
        }
    }
}