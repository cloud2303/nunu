package service

import (
	"{{ .ProjectName }}/api/v1"
	"{{ .ProjectName }}/internal/model"
	"{{ .ProjectName }}/internal/repository"
	"context"
)

type {{ .StructName }}Service interface {
	Get{{ .StructName }}(ctx context.Context, id string) (*model.{{ .StructName }}, error)
	Create{{ .StructName }}(ctx context.Context) (*v1.Create{{ .StructName }}Response, error)
	Update{{ .StructName }}(ctx context.Context, req *v1.Update{{ .StructName }}Request) (*v1.Update{{ .StructName }}Response, error)
	Delete{{ .StructName }}(ctx context.Context, req *v1.Delete{{ .StructName }}Request) error
	Get{{ .StructName }}List(ctx context.Context, req *v1.Get{{ .StructName }}sRequest) (*v1.Get{{ .StructName }}sResponse, error)
}

func New{{ .StructName }}Service(
	service *Service,
	{{ .StructNameLowerFirst }}Repo repository.{{ .StructName }},
) {{ .StructName }}Service {
	return &{{ .StructNameLowerFirst }}Service{
		Service:   service,
		{{ .StructNameLowerFirst }}Repo: {{ .StructNameLowerFirst }}Repo,
	}
}

type {{ .StructNameLowerFirst }}Service struct {
	*Service
	{{ .StructNameLowerFirst }}Repo repository.{{ .StructName }}
}

// Get{{ .StructName }} 获取{{ .StructName }}详情
func (s *{{ .StructNameLowerFirst }}Service) Get{{ .StructName }}(ctx context.Context, id string) (*model.{{ .StructName }}, error) {
	return s.{{ .StructNameLowerFirst }}Repo.Get{{ .StructName }}(ctx, id)
}

// Create{{ .StructName }} 创建{{ .StructName }}
func (s *{{ .StructNameLowerFirst }}Service) Create{{ .StructName }}(ctx context.Context) (*v1.Create{{ .StructName }}Response, error) {
	return s.{{ .StructNameLowerFirst }}Repo.Create{{ .StructName }}(ctx)
}

// Update{{ .StructName }} 更新{{ .StructName }}
func (s *{{ .StructNameLowerFirst }}Service) Update{{ .StructName }}(ctx context.Context, req *v1.Update{{ .StructName }}Request) (*v1.Update{{ .StructName }}Response, error) {
	return s.{{ .StructNameLowerFirst }}Repo.Update{{ .StructName }}(ctx, req)
}

// Delete{{ .StructName }} 删除{{ .StructName }}
func (s *{{ .StructNameLowerFirst }}Service) Delete{{ .StructName }}(ctx context.Context, req *v1.Delete{{ .StructName }}Request) error {
	return s.{{ .StructNameLowerFirst }}Repo.Delete{{ .StructName }}(ctx, req)
}

// Get{{ .StructName }}List 获取{{ .StructName }}列表
func (s *{{ .StructNameLowerFirst }}Service) Get{{ .StructName }}List(ctx context.Context, req *v1.Get{{ .StructName }}sRequest) (*v1.Get{{ .StructName }}sResponse, error) {
	return s.{{ .StructNameLowerFirst }}Repo.Get{{ .StructName }}List(ctx, req)
}
