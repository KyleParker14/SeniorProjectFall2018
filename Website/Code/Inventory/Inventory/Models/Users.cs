﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;


namespace Inventory.Models
{
    public class Users
    {
        [Display(Name ="User Name"), Required(ErrorMessage = "Please enter User Name")]
        public String UserID { get; set; }
        [Display(Name = "Password"), Required(ErrorMessage = "Please enter Password"), DataType(DataType.Password)]
        public String Password_Field { get; set; }
        [Display(Name = "Re-Enter Password"), Required(ErrorMessage = "Please re-enter Password"), DataType(DataType.Password)]
        public String Password_Field1 { get; set; }
        [Display(Name = "First Name"), Required(ErrorMessage = "Please enter First Name")]
        public String First_Name { get; set; }
        [Display(Name = "Last Name"), Required(ErrorMessage = "Please enter Last Name")]
        public String Last_Name { get; set; }
        [Display(Name = "Phone Number"), Required(ErrorMessage = "Please enter Phone Number")]
        public String Phone_Number { get; set; }
        [Display(Name = "Street"), Required(ErrorMessage = "Please enter Street")]
        public String Street { get; set; }
        [Display(Name = "City"), Required(ErrorMessage = "Please enter City")]
        public String City { get; set; }
        [Display(Name = "Zip Code"), Required(ErrorMessage = "Please enter Zip Code")]
        public String Zip_Code { get; set; }
        [Display(Name = "Email"), Required(ErrorMessage = "Please enter Email")]
        public String Email { get; set; }
        public char User_Type { get; set; }

    }
}