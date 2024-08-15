@extends('master.admin')
@section('title', 'Dashboard')
@section('main')

<div class="row col-lg-10">
      <h2>Welcome {{ auth()->user()->name }} back to the admin interface </h2>
  </div>

@stop()
