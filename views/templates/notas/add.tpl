{extends file="inc/theme.tpl"}
{$title = "Añadir nota"}
{$buttons = false}
{$url = '/materias/registrar'}
{$btitle = 'Registrar materia'}
{$active = 'materia'}
{block name=content}
<div class="sm:max-w-xl mx-auto">
  <div class="mt-8 sm:mx-auto">
    <div class="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
      <form action="/materias/notas/agregar" method="post" class="space-y-8 divide-y divide-gray-200">
        <div class="space-y-8 divide-y divide-gray-200">
          <div>
            <div>
            {if isset($errors)}
            <ul class="mt-8">
                {foreach $errors as $error}
                    <li>{$error}</li>
                {/foreach}
            </ul>
            {/if}
            <div class="mt-6 grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-6">
              <div class="sm:col-span-4">
                <div>
                  <label for="nota" class="block text-sm font-medium text-gray-700">Nota</label>
                  <div class="mt-1 relative rounded-md shadow-sm">

                    <input type="text" name="nota" {if isset($smarty.post.nota)}value="{$smarty.post.nota}" {/if}
                      id="nota"
                      class="focus:ring-indigo-500 focus:border-indigo-500 block w-full pl-7 pr-12 sm:text-sm border-gray-300 rounded-md"
                      placeholder="0.00">
                    <div class="absolute inset-y-0 right-0 flex items-center">
                      <label for="ponderacion" class="sr-only">Ponderación</label>
                      
                      <select id="ponderacion" name="ponderacion" class="focus:ring-indigo-500 focus:border-indigo-500 h-full py-0 pl-2 pr-7 border-transparent bg-transparent text-gray-500 sm:text-sm rounded-md">
                        <option {if isset($smarty.post.ponderacion) and $smarty.post.ponderacion == 0}selected{/if} value="0">Ponderación</option>
                        <option {if isset($smarty.post.ponderacion) and $smarty.post.ponderacion == 0.1}selected{/if} value="0.1">10%</option>
                        <option selected value="0.2">20%</option>
                        <option {if isset($smarty.post.ponderacion) and $smarty.post.ponderacion == 0.3}selected{/if} value="0.3">30%</option>
                        <option {if isset($smarty.post.ponderacion) and $smarty.post.ponderacion == 0.4}selected{/if} value="0.4">40%</option>
                        <option {if isset($smarty.post.ponderacion) and $smarty.post.ponderacion == 0.5}selected{/if} value="0.5">50%</option>
                        <option {if isset($smarty.post.ponderacion) and $smarty.post.ponderacion == 0.6}selected{/if} value="0.6">60%</option>
                        <option {if isset($smarty.post.ponderacion) and $smarty.post.ponderacion == 0.7}selected{/if} value="0.7">70%</option>
                        <option {if isset($smarty.post.ponderacion) and $smarty.post.ponderacion == 0.8}selected{/if} value="0.8">80%</option>
                        <option {if isset($smarty.post.ponderacion) and $smarty.post.ponderacion == 0.9}selected{/if} value="0.9">90%</option>
                        <option {if isset($smarty.post.ponderacion) and $smarty.post.ponderacion == 1}selected{/if} value="1">100%</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
              <div class="sm:col-span-2">
                <div>
                  <label for="unidad" class="block text-sm font-medium text-gray-700">Unidad</label>
                  <div class="mt-1 relative rounded-md shadow-sm">
                    <div class=" inset-y-0 right-0 flex items-center">
                      <label for="unidad" class="sr-only">Unidad</label>
                      <select id="unidad" name="unidad" class="focus:ring-indigo-500 focus:border-indigo-500 block w-full pl-7 pr-12 sm:text-sm border-gray-300 rounded-md">
                        <option {if isset($smarty.post.unidad) and $smarty.post.unidad == "0"}selected{/if} value="0">Unidad</option>
                        <option {if isset($smarty.post.unidad) and $smarty.post.unidad == "I"}selected{/if} value="I">I</option>
                        <option {if isset($smarty.post.unidad) and $smarty.post.unidad == "II"}selected{/if} value="II">II</option>
                        <option {if isset($smarty.post.unidad) and $smarty.post.unidad == "III"}selected{/if} value="III">III</option>
                        <option {if isset($smarty.post.unidad) and $smarty.post.unidad == "IV"}selected{/if} value="IV">IV</option>
                        <option {if isset($smarty.post.unidad) and $smarty.post.unidad == "V"}selected{/if} value="V">V</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>
        <input type="hidden" value="{$materia->id}" name="idMateria" />
        <div class="pt-5">
          <div class="flex justify-end">
            <button type="submit" name="submit" class="ml-3 inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
              Añadir
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
{/block}