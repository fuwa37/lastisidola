package models

type Tuser struct {
	Nama string `form:"name"`
	Email string `form:"email"`
	Tlp string `form:"telepon"`
	Password string `form:"password"`
}

type Duser []Tuser