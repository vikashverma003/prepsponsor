<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TeamFormRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [

            'name' => 'required',

            'email' => 'required|email|unique:users,email',

            'password' => 'required|same:confirm_password'

            ];
    }
	
	public function messages()

    {

        return [

            'name.required' => 'The :attribute field can not be blank value',

        ];

    }
}
