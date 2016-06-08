using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace BazyZadania {
    public class Zadanie13CitiesDB {
        private string connectionString;

        public Zadanie13CitiesDB() {
            this.connectionString = WebConfigurationManager.ConnectionStrings["MBase"].ConnectionString;
        }

        public List<Zadanie13CityDetails> cities_select_all() {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand("city_select_all", connection);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            connection.Open();
            SqlDataReader dr = command.ExecuteReader();
            List<Zadanie13CityDetails> citiesList = new List<Zadanie13CityDetails>();

            while (dr.Read()) {
                Zadanie13CityDetails ud = new Zadanie13CityDetails((int)dr["Id"], (string)dr["Name"], (string)dr["ShortName"]);
                citiesList.Add(ud);
            }

            return citiesList;
        }


        public void cities_insert(string name, string shortname) {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand("cities_insert", connection);
            command.Parameters.AddWithValue("@name", name);
            command.Parameters.AddWithValue("@shortname", shortname);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            connection.Open();
            command.ExecuteNonQuery();
        }


        public void cities_update(int id, string name, string shortname) {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand("cities_update", connection);
            command.Parameters.AddWithValue("@name", name);
            command.Parameters.AddWithValue("@shortname", shortname);
            command.Parameters.AddWithValue("@id", id);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            connection.Open();
            command.ExecuteNonQuery();
        }

        public void cities_delete(int id) {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand("cities_delete", connection);
            command.Parameters.AddWithValue("@id", id);
            command.CommandType = System.Data.CommandType.StoredProcedure;
            connection.Open();
            command.ExecuteNonQuery();
        }
    }
}