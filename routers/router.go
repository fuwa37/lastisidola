package routers

import (
	"lasti/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/index", &controllers.MainController{})
    beego.Router("/login", &controllers.LoginController{})
    beego.Router("/register", &controllers.RegController{})
    beego.Router("/server", &controllers.MainController{})
    beego.Router("/home", &controllers.MainController{})
    beego.Router("/laptop", &controllers.LaptopController{})
}
