package repository

import (
	"context"
	"{{ .ProjectName }}/api/v1"
	"{{ .ProjectName }}/ent"
	"{{ .ProjectName }}/ent/{{ .StructNameLowerFirst }}"
	"{{ .ProjectName }}/internal/model"
	"errors"
)

type {{ .StructName }} interface {
	Get{{ .StructName }}(ctx context.Context, req *v1.Get{{ .StructName }}Request) (*v1.Get{{ .StructName }}Response, error)
	Create{{ .StructName }}(ctx context.Context, req *v1.Create{{ .StructName }}Request) (*v1.Create{{ .StructName }}Response, error)
	Update{{ .StructName }}(ctx context.Context, req *v1.Update{{ .StructName }}Request) (*v1.Update{{ .StructName }}Response, error)
	Delete{{ .StructName }}(ctx context.Context, req *v1.Delete{{ .StructName }}Request) error
	Get{{ .StructName }}List(ctx context.Context, req *v1.Get{{ .StructName }}sRequest) (*v1.Get{{ .StructName }}sResponse, error)
}

func New{{ .StructName }}(repo *Repository) {{ .StructName }} {
	return &{{ .StructNameLowerFirst }}{
		Repository: repo,
	}
}

type {{ .StructNameLowerFirst }} struct {
	*Repository
}

// Get{{ .StructName }} 获取{{ .StructName }}详情
func (r *{{ .StructNameLowerFirst }}) Get{{ .StructName }}(ctx context.Context, req *v1.Get{{ .StructName }}Request) (*v1.Get{{ .StructName }}Response, error) {
	data, err := r.db.{{ .StructName }}.
		Query().
		Where({{ .StructNameLowerFirst }}.ID(req.ID)).
		First(ctx)
	if err != nil {
		if ent.IsNotFound(err) {
			return nil, errors.New("未找到对应{{ .StructName }}")
		}
		return nil, err
	}
	
	return &v1.Get{{ .StructName }}Response{
		ID: data.ID,
		// 添加其他字段映射
	}, nil
}

// Create{{ .StructName }} 创建{{ .StructName }}
func (r *{{ .StructNameLowerFirst }}) Create{{ .StructName }}(ctx context.Context, req *v1.Create{{ .StructName }}Request) (*v1.Create{{ .StructName }}Response, error) {
	data, err := r.db.{{ .StructName }}.
		Create().
		// 设置创建字段
		Save(ctx)
	if err != nil {
		if ent.IsConstraintError(err) {
			return nil, errors.New("{{ .StructName }}已存在")
		}
		return nil, err
	}
	
	return &v1.Create{{ .StructName }}Response{
		ID: data.ID,
		// 添加其他字段映射
	}, nil
}

// Update{{ .StructName }} 更新{{ .StructName }}
func (r *{{ .StructNameLowerFirst }}) Update{{ .StructName }}(ctx context.Context, req *v1.Update{{ .StructName }}Request) (*v1.Update{{ .StructName }}Response, error) {
	data, err := r.db.{{ .StructName }}.
		UpdateOneID(req.ID).
		// 设置更新字段
		Save(ctx)
	if err != nil {
		if ent.IsNotFound(err) {
			return nil, errors.New("未找到对应{{ .StructName }}")
		}
		return nil, err
	}
	
	return &v1.Update{{ .StructName }}Response{
		ID: data.ID,
		// 添加其他字段映射
	}, nil
}

// Delete{{ .StructName }} 删除{{ .StructName }}
func (r *{{ .StructNameLowerFirst }}) Delete{{ .StructName }}(ctx context.Context, req *v1.Delete{{ .StructName }}Request) error {
	err := r.db.{{ .StructName }}.
		DeleteOneID(req.ID).
		Exec(ctx)
	if err != nil {
		if ent.IsNotFound(err) {
			return errors.New("未找到对应{{ .StructName }}")
		}
		return err
	}
	return nil
}

// Get{{ .StructName }}List 获取{{ .StructName }}列表
func (r *{{ .StructNameLowerFirst }}) Get{{ .StructName }}List(ctx context.Context, req *v1.Get{{ .StructName }}sRequest) (*v1.Get{{ .StructName }}sResponse, error) {
	// 查询全部数量
	total, err := r.db.{{ .StructName }}.Query().Count(ctx)
	if err != nil {
		r.logger.Sugar().Error(err.Error())
		return nil, err
	}

	// 查询分页数据
	list, err := r.db.{{ .StructName }}.Query().
		Limit(req.PageSize).
		Offset((req.Page-1)*req.PageSize).
		Order(ent.Desc({{ .StructNameLowerFirst }}.FieldCreateTime)).
		All(ctx)
	if err != nil {
		r.logger.Sugar().Error(err.Error())
		return nil, err
	}

	items := make([]model.{{ .StructName }}Info, 0, len(list))
	for _, item := range list {
		items = append(items, model.{{ .StructName }}Info{
			ID: item.ID,
			// 添加其他字段映射
		})
	}

	return &v1.Get{{ .StructName }}sResponse{
		List:  items,
		Total: total,
	}, nil
}
