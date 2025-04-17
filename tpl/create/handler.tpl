package handler

import (
	"{{ .ProjectName }}/api/v1"
	"{{ .ProjectName }}/internal/service"
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
		Handler:       handler,
		{{ .StructNameLowerFirst }}Service: {{ .StructNameLowerFirst }}Service,
	}
}

// Get{{ .StructName }} godoc
// @Summary 获取{{ .StructName }}信息
// @Description 获取{{ .StructName }}的详细信息
// @Tags {{ .StructName }}
// @Accept json
// @Produce json
// @Success 200 {object} v1.Response "成功返回{{ .StructName }}信息"
// @Failure 400 {object} v1.Response "请求参数错误"
// @Failure 500 {object} v1.Response "服务器内部错误"
// @Router /v1/{{ .StructNameLowerFirst }}/get [post]
func (h *{{ .StructName }}Handler) Get{{ .StructName }}(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()
	var req = &v1.Get{{ .StructName }}Request{}
	
	err := h.validator.BindJSON(r, req)
	if err != nil {
		v1.HandleError(w, r, http.StatusBadRequest, err, nil)
		return
	}
	
	result, err := h.{{ .StructNameLowerFirst }}Service.Get{{ .StructName }}(ctx, req)
	if err != nil {
		v1.HandleError(w, r, http.StatusBadRequest, err, nil)
		return
	}
	
	v1.HandleSuccess(w, r, result)
}

// Create{{ .StructName }} godoc
// @Summary 创建{{ .StructName }}
// @Description 创建新的{{ .StructName }}
// @Tags {{ .StructName }}
// @Accept json
// @Produce json
// @Success 200 {object} v1.Response "成功创建{{ .StructName }}"
// @Failure 400 {object} v1.Response "请求参数错误"
// @Failure 500 {object} v1.Response "服务器内部错误"
// @Router /v1/{{ .StructNameLowerFirst }}/create [post]
func (h *{{ .StructName }}Handler) Create{{ .StructName }}(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()
	var req = &v1.Create{{ .StructName }}Request{}
	
	err := h.validator.BindJSON(r, req)
	if err != nil {
		v1.HandleError(w, r, http.StatusBadRequest, err, nil)
		return
	}
	
	result, err := h.{{ .StructNameLowerFirst }}Service.Create{{ .StructName }}(ctx, req)
	if err != nil {
		v1.HandleError(w, r, http.StatusBadRequest, err, nil)
		return
	}
	
	v1.HandleSuccess(w, r, result)
}

// Update{{ .StructName }} godoc
// @Summary 更新{{ .StructName }}
// @Description 更新{{ .StructName }}信息
// @Tags {{ .StructName }}
// @Accept json
// @Produce json
// @Success 200 {object} v1.Response "成功更新{{ .StructName }}"
// @Failure 400 {object} v1.Response "请求参数错误"
// @Failure 500 {object} v1.Response "服务器内部错误"
// @Router /v1/{{ .StructNameLowerFirst }}/update [post]
func (h *{{ .StructName }}Handler) Update{{ .StructName }}(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()
	var req = &v1.Update{{ .StructName }}Request{}
	
	err := h.validator.BindJSON(r, req)
	if err != nil {
		v1.HandleError(w, r, http.StatusBadRequest, err, nil)
		return
	}
	
	result, err := h.{{ .StructNameLowerFirst }}Service.Update{{ .StructName }}(ctx, req)
	if err != nil {
		v1.HandleError(w, r, http.StatusBadRequest, err, nil)
		return
	}
	
	v1.HandleSuccess(w, r, result)
}

// Delete{{ .StructName }} godoc
// @Summary 删除{{ .StructName }}
// @Description 删除指定的{{ .StructName }}
// @Tags {{ .StructName }}
// @Accept json
// @Produce json
// @Success 200 {object} v1.Response "成功删除{{ .StructName }}"
// @Failure 400 {object} v1.Response "请求参数错误"
// @Failure 500 {object} v1.Response "服务器内部错误"
// @Router /v1/{{ .StructNameLowerFirst }}/delete [post]
func (h *{{ .StructName }}Handler) Delete{{ .StructName }}(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()
	var req = &v1.Delete{{ .StructName }}Request{}
	
	err := h.validator.BindJSON(r, req)
	if err != nil {
		v1.HandleError(w, r, http.StatusBadRequest, err, nil)
		return
	}
	
	err = h.{{ .StructNameLowerFirst }}Service.Delete{{ .StructName }}(ctx, req)
	if err != nil {
		v1.HandleError(w, r, http.StatusBadRequest, err, nil)
		return
	}
	
	v1.HandleSuccess(w, r, nil)
}

// Get{{ .StructName }}List godoc
// @Summary 获取{{ .StructName }}列表
// @Description 获取{{ .StructName }}列表，支持分页
// @Tags {{ .StructName }}
// @Accept json
// @Produce json
// @Success 200 {object} v1.Response "成功返回{{ .StructName }}列表"
// @Failure 400 {object} v1.Response "请求参数错误"
// @Failure 500 {object} v1.Response "服务器内部错误"
// @Router /v1/{{ .StructNameLowerFirst }}/list [post]
func (h *{{ .StructName }}Handler) Get{{ .StructName }}List(w http.ResponseWriter, r *http.Request) {
	ctx := r.Context()
	var req = &v1.Get{{ .StructName }}sRequest{}
	
	err := h.validator.BindJSON(r, req)
	if err != nil {
		v1.HandleError(w, r, http.StatusBadRequest, err, nil)
		return
	}
	
	result, err := h.{{ .StructNameLowerFirst }}Service.Get{{ .StructName }}List(ctx, req)
	if err != nil {
		v1.HandleError(w, r, http.StatusBadRequest, err, nil)
		return
	}
	
	v1.HandleSuccess(w, r, result)
}
