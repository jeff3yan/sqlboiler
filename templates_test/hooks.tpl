{{- if eq .NoHooks false -}}
{{- $tableNameSingular := .Table.Name | singular | titleCase -}}
{{- $tableNamePlural := .Table.Name | plural | titleCase -}}
{{- $varNamePlural := .Table.Name | plural | camelCase -}}
{{- $varNameSingular := .Table.Name | singular | camelCase -}}
func {{$varNameSingular}}BeforeInsertHook(e boil.Executor, o *{{$tableNameSingular}}) error {
  *o = {{$tableNameSingular}}{}
  return nil
}

func {{$varNameSingular}}AfterInsertHook(e boil.Executor, o *{{$tableNameSingular}}) error {
  *o = {{$tableNameSingular}}{}
  return nil
}

func {{$varNameSingular}}AfterSelectHook(e boil.Executor, o *{{$tableNameSingular}}) error {
  *o = {{$tableNameSingular}}{}
  return nil
}

func {{$varNameSingular}}BeforeUpdateHook(e boil.Executor, o *{{$tableNameSingular}}) error {
  *o = {{$tableNameSingular}}{}
  return nil
}

func {{$varNameSingular}}AfterUpdateHook(e boil.Executor, o *{{$tableNameSingular}}) error {
  *o = {{$tableNameSingular}}{}
  return nil
}

func {{$varNameSingular}}BeforeDeleteHook(e boil.Executor, o *{{$tableNameSingular}}) error {
  *o = {{$tableNameSingular}}{}
  return nil
}

func {{$varNameSingular}}AfterDeleteHook(e boil.Executor, o *{{$tableNameSingular}}) error {
  *o = {{$tableNameSingular}}{}
  return nil
}

func {{$varNameSingular}}BeforeUpsertHook(e boil.Executor, o *{{$tableNameSingular}}) error {
  *o = {{$tableNameSingular}}{}
  return nil
}

func {{$varNameSingular}}AfterUpsertHook(e boil.Executor, o *{{$tableNameSingular}}) error {
  *o = {{$tableNameSingular}}{}
  return nil
}

func test{{$tableNamePlural}}Hooks(t *testing.T) {
  t.Parallel()

  var err error

  empty := &{{$tableNameSingular}}{}
  o := &{{$tableNameSingular}}{}

  seed := randomize.NewSeed()
  if err = randomize.Struct(seed, o, {{$varNameSingular}}DBTypes, false); err != nil {
    t.Errorf("Unable to randomize {{$tableNameSingular}} object: %s", err)
  }

  {{$tableNameSingular}}AddHook(boil.HookBeforeInsert, {{$varNameSingular}}BeforeInsertHook)
  if err = o.doBeforeInsertHooks(nil); err != nil {
    t.Errorf("Unable to execute doBeforeInsertHooks: %s", err)
  }
  if !reflect.DeepEqual(o, empty) {
    t.Errorf("Expected BeforeInsertHook function to empty object, but got: %#v", o)
  }
  {{$varNameSingular}}BeforeInsertHooks = []{{$tableNameSingular}}Hook{}

  {{$tableNameSingular}}AddHook(boil.HookAfterInsert, {{$varNameSingular}}AfterInsertHook)
  if err = o.doAfterInsertHooks(nil); err != nil {
    t.Errorf("Unable to execute doAfterInsertHooks: %s", err)
  }
  if !reflect.DeepEqual(o, empty) {
    t.Errorf("Expected AfterInsertHook function to empty object, but got: %#v", o)
  }
  {{$varNameSingular}}AfterInsertHooks = []{{$tableNameSingular}}Hook{}

  {{$tableNameSingular}}AddHook(boil.HookAfterSelect, {{$varNameSingular}}AfterSelectHook)
  if err = o.doAfterSelectHooks(nil); err != nil {
    t.Errorf("Unable to execute doAfterSelectHooks: %s", err)
  }
  if !reflect.DeepEqual(o, empty) {
    t.Errorf("Expected AfterSelectHook function to empty object, but got: %#v", o)
  }
  {{$varNameSingular}}AfterSelectHooks = []{{$tableNameSingular}}Hook{}

  {{$tableNameSingular}}AddHook(boil.HookBeforeUpdate, {{$varNameSingular}}BeforeUpdateHook)
  if err = o.doBeforeUpdateHooks(nil); err != nil {
    t.Errorf("Unable to execute doBeforeUpdateHooks: %s", err)
  }
  if !reflect.DeepEqual(o, empty) {
    t.Errorf("Expected BeforeUpdateHook function to empty object, but got: %#v", o)
  }
  {{$varNameSingular}}BeforeUpdateHooks = []{{$tableNameSingular}}Hook{}

  {{$tableNameSingular}}AddHook(boil.HookAfterUpdate, {{$varNameSingular}}AfterUpdateHook)
  if err = o.doAfterUpdateHooks(nil); err != nil {
    t.Errorf("Unable to execute doAfterUpdateHooks: %s", err)
  }
  if !reflect.DeepEqual(o, empty) {
    t.Errorf("Expected AfterUpdateHook function to empty object, but got: %#v", o)
  }
  {{$varNameSingular}}AfterUpdateHooks = []{{$tableNameSingular}}Hook{}

  {{$tableNameSingular}}AddHook(boil.HookBeforeDelete, {{$varNameSingular}}BeforeDeleteHook)
  if err = o.doBeforeDeleteHooks(nil); err != nil {
    t.Errorf("Unable to execute doBeforeDeleteHooks: %s", err)
  }
  if !reflect.DeepEqual(o, empty) {
    t.Errorf("Expected BeforeDeleteHook function to empty object, but got: %#v", o)
  }
  {{$varNameSingular}}BeforeDeleteHooks = []{{$tableNameSingular}}Hook{}

  {{$tableNameSingular}}AddHook(boil.HookAfterDelete, {{$varNameSingular}}AfterDeleteHook)
  if err = o.doAfterDeleteHooks(nil); err != nil {
    t.Errorf("Unable to execute doAfterDeleteHooks: %s", err)
  }
  if !reflect.DeepEqual(o, empty) {
    t.Errorf("Expected AfterDeleteHook function to empty object, but got: %#v", o)
  }
  {{$varNameSingular}}AfterDeleteHooks = []{{$tableNameSingular}}Hook{}

  {{$tableNameSingular}}AddHook(boil.HookBeforeUpsert, {{$varNameSingular}}BeforeUpsertHook)
  if err = o.doBeforeUpsertHooks(nil); err != nil {
    t.Errorf("Unable to execute doBeforeUpsertHooks: %s", err)
  }
  if !reflect.DeepEqual(o, empty) {
    t.Errorf("Expected BeforeUpsertHook function to empty object, but got: %#v", o)
  }
  {{$varNameSingular}}BeforeUpsertHooks = []{{$tableNameSingular}}Hook{}

  {{$tableNameSingular}}AddHook(boil.HookAfterUpsert, {{$varNameSingular}}AfterUpsertHook)
  if err = o.doAfterUpsertHooks(nil); err != nil {
    t.Errorf("Unable to execute doAfterUpsertHooks: %s", err)
  }
  if !reflect.DeepEqual(o, empty) {
    t.Errorf("Expected AfterUpsertHook function to empty object, but got: %#v", o)
  }
  {{$varNameSingular}}AfterUpsertHooks = []{{$tableNameSingular}}Hook{}
}
{{- end}}
