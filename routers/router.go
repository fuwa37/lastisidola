package routers

import (
	"lasti/controllers"
	"github.com/astaxie/beego"
)

func init() {
    beego.Router("/", &controllers.MainController{})
    beego.Router("/login", &controllers.MainController{})
    beego.Router("/register", &controllers.MainController{})
    beego.Router("/server", &controllers.MainController{})
    beego.Router("/home", &controllers.MainController{})
    beego.Router("/laptop", &controllers.MainController{})
}
