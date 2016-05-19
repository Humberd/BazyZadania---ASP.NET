using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BazyZadania {
    public class UserDetails {
        public int id { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public int age { get; set; }
        public string username { get; set; }

        public UserDetails(int id, string firstName, string lastName, int age, string username) {
            this.id = id;
            this.firstName = firstName;
            this.lastName = lastName;
            this.age = age;
            this.username = username;
        }
    }
}