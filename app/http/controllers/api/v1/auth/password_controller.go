// Package auth 处理用户注册、登录、密码重置
package auth

import (
    v1 "gohub/app/http/controllers/api/v1"
    "gohub/app/models/user"
    "gohub/app/requests"
    "gohub/pkg/response"

    "github.com/gin-gonic/gin"
)

// PasswordController 用户控制器
type PasswordController struct {
    v1.BaseAPIController
}


// ResetByEmail 使用 Email 和验证码重置密码
func (pc *PasswordController) ResetByEmail(c *gin.Context) {
	// 1. 验证表单
	request := requests.ResetByEmailRequest{}
	if ok := requests.Validate(c, &request, requests.ResetByEmail); !ok {
		return
	}

	// 2. 更新密码
	userModel := user.GetByEmail(request.Email)
	if userModel.ID == 0 {
		response.Abort404(c)
	} else {
		userModel.Password = request.Password
		userModel.Save()
		response.Success(c)
	}
}
