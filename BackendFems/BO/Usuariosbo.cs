using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BackendFems.BO
{
    public class Usuariosbo
    {
        private int id;
        private bool resp;
        private string nombre;
        private string apellido;        
        private string correo;
        private string pass;
        private string telefono;
        private string sexo;
        private string curp;
        private string tusuario;

        public int Id
        {
            get
            {
                return id;
            }

            set
            {
                id = value;
            }
        }

        public string Nombre
        {
            get
            {
                return nombre;
            }

            set
            {
                nombre = value;
            }
        }

        public string Apellido
        {
            get
            {
                return apellido;
            }

            set
            {
                apellido = value;
            }
        }

        public string Correo
        {
            get
            {
                return correo;
            }

            set
            {
                correo = value;
            }
        }

        public string Pass
        {
            get
            {
                return pass;
            }

            set
            {
                pass = value;
            }
        }
        public string Telefono
        {
            get
            {
                return telefono;
            }

            set
            {
                telefono = value;
            }
        }

        public string Sexo
        {
            get
            {
                return sexo;
            }

            set
            {
                sexo = value;
            }
        }

        public string Curp
        {
            get
            {
                return curp;
            }

            set
            {
                curp = value;
            }
        }

        public string Tusuario
        {
            get
            {
                return tusuario;
            }

            set
            {
                tusuario = value;
            }
        }

    }
}