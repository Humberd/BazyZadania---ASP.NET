using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BazyZadania {
    public class Zadanie13UserDetails {
        public int id { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public int age { get; set; }
        public string username { get; set; }
        public int id_city { get; set; }
        public string name { get; set; }

        public Zadanie13UserDetails(int id, string firstName, string lastName, int age, string username, int id_city, string name) {
            this.id = id;
            this.firstName = firstName;
            this.lastName = lastName;
            this.age = age;
            this.username = username;
            this.id_city = id_city;
            this.name = name;
        }
    }
}