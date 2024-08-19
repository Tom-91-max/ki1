<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Service;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $data = Service::myFillter()->paginate(12);
        return view('admin.service.index', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.service.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|min:4|max:150',
            'description' => 'required|min:4',
            'link' => 'required',
        ]);
        $data = $request->only('name', 'link', 'description', 'position', 'status');
        $imgname = $request->img->hashName();
        $request->img->move(public_path('uploads/service'), $imgname);
        $data['image'] = $imgname;
        if (service::create($data)) {
            return redirect()->route('service.index')->with('ok', 'Create new service successffuly');
        } else {
            return redirect()->back()->with('no', 'Something error, Please try again');
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Service $service)
    {
        return view('admin.service.edit', compact('service'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Service $service)
    {
        $request->validate([
            'name' => 'required|min:4|max:150',
            'description' => 'required|min:4',
            'link' => 'required',
        ]);
        $data = $request->only('name', 'link', 'description', 'position', 'status');

        if ($request->has('img')) {
            $img_name = $service->image;
            $image_path = public_path('uploads/service').'/'.$img_name;
            if (file_exists($image_path)) {
                unlink($image_path);
            }
            $imag_name = $request->img->hashName();
            $request->img->move(public_path('uploads/service'), $imag_name);
            $data['image'] = $imag_name;
        }

        if ($service->update($data)) {
            return redirect()->route('service.index')->with('ok', 'Update new service successffuly');
        } else {
            return redirect()->back()->with('no', 'Something error, Please try again');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Service $service)
    {
        $img_name = $service->image;
        $image_path = public_path('uploads/service').'/'.$img_name;
        if ($service->delete()) {
            if (file_exists($image_path)) {
                unlink($image_path);
            }
            return redirect()->route('service.index')->with('ok','Delete product successffuly');
        }else{
            return redirect()->back()->with('no','Something error, Please try again');
        }
    }
}
