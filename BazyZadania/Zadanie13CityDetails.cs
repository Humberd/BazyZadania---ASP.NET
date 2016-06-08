using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BazyZadania {
    public class Zadanie13CityDetails {
        public Zadanie13CityDetails(int id, string name, string shortname) {
            Id = id;
            SetData(name, shortname);
        }

        public Zadanie13CityDetails(string name, string shortname) {
            Id = -1;
            SetData(name, shortname);
        }
        public int Id { get; set; }
        public string Name { get; set; }
        public string ShortName { get; set; }

        private void SetData(string name, string shortname) {
            Name = name;
            ShortName = shortname;

        }
    }
}