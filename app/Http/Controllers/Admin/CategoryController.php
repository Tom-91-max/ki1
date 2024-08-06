<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $key = request('key');
        $data = Category::orderBy('id', 'DESC')->paginate();
        if ($key){
            $data = Category::where('name', 'LIKE', '%'.$key.'%')->paginate();
        }
        return view('admin.category.index', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.category.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = request()->all('name','status');
        // dd($data);
        if (Category::create($data)){
            return redirect()->route('category.index')->with('ok','Create new product successffuly');
        }else {
            return redirect()->route('category.index')->with('no','Something error, Please try again');
        }
        
    }

    /**
     * Display the specified resource.
     */
    public function show(Category $category)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Category $category)
    {
        return view('admin.category.edit', compact('category'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Category $category)
    {
        $data =  request()->all('name','status');
        // dd($data);
        if ($category->update($data)){
            return redirect()->route('category.index')->with('ok','Create new product successffuly');
        }else {
            return redirect()->route('category.index')->with('no','Something error, Please try again');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Category $category)
    {
        if ($category->delete()){
            return redirect()->route('category.index')->with('ok','Create new product successffuly');
        }else {
            xreturn redirect()->route('category.index')->with('no','Something error, Please try again');
        }
    }
}
