package handler

import (
	"{{ .ProjectName }}/internal/service"
	"{{ .ProjectName }}/pkg/helper/resp"
	"net/http"
)

type {{ .StructName }}Handler struct {
	*Handler
	{{ .StructNameLowerFirst }}Service service.{{ .StructName }}Service
}

func New{{ .StructName }}Handler(
	handler *Handler,
	{{ .StructNameLowerFirst }}Service service.{{ .StructName }}Service,
) *{{ .StructName }}Handler {
	return &{{ .StructName }}Handler{
		Handler:      handler,
		{{ .StructNameLowerFirst }}Service: {{ .StructNameLowerFirst }}Service,
	}
}

// Get{{ .StructName }} godoc
// @Summary 获取{{ .StructName }}信息
// @Description 获取{{ .StructName }}的详细信息
// @Tags {{ .StructName }}
// @Accept json
// @Produce json
// @Success 200 {object} resp.Response "成功返回{{ .StructName }}信息"
// @Failure 400 {object} resp.Response "请求参数错误"
// @Failure 500 {object} resp.Response "服务器内部错误"
// @Router /v1/{{ .StructNameLowerFirst }}/get [post]
func (h *{{ .StructName }}Handler) Get{{ .StructName }}(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()
	// 实现获取{{ .StructName }}的逻辑
	resp.HandleSuccess(w, r, nil)
}
