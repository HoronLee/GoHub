package config

import (
	"gohub/pkg/config"
)

func init() {

	config.Add("redis", func() map[string]any {
		return map[string]any{

			"host":     config.Env("REDIS_HOST", "127.0.0.1"),
			"port":     config.Env("REDIS_PORT", "6379"),
			"password": config.Env("REDIS_PASSWORD", ""),

			// 业务类存储使用 1 (图片验证码、短信验证码、会话)
			"database": config.Env("REDIS_MAIN_DB", 1),
		}
	})
}
