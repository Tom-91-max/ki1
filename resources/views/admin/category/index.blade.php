@extends('master.admin')
@section('title', 'Category manager')
@section('main')

<form action="" method="GET" class="form-inline" role="form">
@csrf
    <div class="form-group">
        <label class="sr-only" for="">label</label>
        <input type="text" class="form-control" name="key" placeholder="Input field">
    </div>



    <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
    <a href="{{ route('category.create') }}" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Add new</a>
</form>


<br>


<table class="table table-hover">
    <thead>
        <tr>
            <th>STT</th>
            <th>Category Name</th>
            <th>Category Status</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        @foreach($data as $cats)
        <tr>

            <td>{{$cats->id}}</td>
            <td>{{$cats->name}}</td>
            <td>{{$cats->status}}</td>
            
            <td class="text-right">
                <form action="{{route('category.destroy', $cats->id)}}" method="POST">
                @csrf @method('DELETE')
                <a href="{{ route('category.edit', $cats->id) }}" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i></a>
                <button href="" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button>
                </form>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>


@stop()