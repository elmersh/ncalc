{extends file="inc/theme.tpl"}
{$title = "registro de cuenta"}
{$buttons = true}

{$active = 'materia'}
{block name=content}
<div class="sm:max-w-xl mx-auto">
{if isset($errors)}
            <ul class="mt-8">
                {foreach $errors as $error}
                    <li>{$error}</li>
                {/foreach}
            </ul>
            {/if}
  {$smarty.post|print_r}
  <div class="mt-8 sm:mx-auto">
    <div class="bg-white py-8 px-4 shadow sm:rounded-lg sm:px-10">
<form action="/materias/registrar" method="post" class="space-y-8 divide-y divide-gray-200">
  <div class="space-y-8 divide-y divide-gray-200">
    <div>
      <div>

      <div class="mt-6 grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-6">
        <div class="sm:col-span-4">
          <label for="nombre" class="block text-sm font-medium text-gray-700">
            Nombre de materia
          </label>
          <div class="mt-1">
            <input type="text" name="nombre" id="nombre" value="{if isset($smarty.post.nombre) }{$smarty.post.nombre}{/if}" autocomplete="family-name" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
          </div>
        </div>

        <div class="sm:col-span-2">
          <label for="codigo" class="block text-sm font-medium text-gray-700">
            Codigo
          </label>
          <div class="mt-1">
            <input id="codigo" name="codigo" type="text" {if isset($smarty.post.codigo) }value='{$smarty.post.codigo}'{/if} autocomplete="codigo" class="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md">
          </div>
        </div>
        <div class="sm:col-span-3">
        <fieldset class="mt-3">
          <div>
            <legend class="text-base font-medium text-gray-900">
              Unidad
            </legend>
          </div>
          <div class="mt-4 space-y-4">
            <div class="flex items-center gap-4">
              <label for="ciclo_i" class="flex gap-2 items-center block text-sm font-medium text-gray-700">
                <input value="I" {if isset($smarty.post.ciclos) && $smarty.post.ciclos == 'I'}checked{/if} id="ciclo_i" name="ciclos" type="radio" class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300">
                <span>I</span>
              </label>
              <label for="ciclo_ii" class="flex gap-2 items-center block text-sm font-medium text-gray-700">
                <input value="II" {if isset($smarty.post.ciclos) && $smarty.post.ciclos == 'II'}checked{/if} id="ciclo_ii" name="ciclos" type="radio" class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300">
                <span>II</span>
              </label>
              <label for="ciclo_iii" class="flex gap-2 items-center block text-sm font-medium text-gray-700">
                <input value="III" {if isset($smarty.post.ciclos) && $smarty.post.ciclos == 'III'}checked{/if} id="ciclo_iii" name="ciclos" type="radio" class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300">
                <span>III</span>
              </label>
              <label for="ciclo_iv" class="flex gap-2 items-center block text-sm font-medium text-gray-700">
                <input value="IV" {if isset($smarty.post.ciclos) && $smarty.post.ciclos == 'IV'}checked{/if} id="ciclo_iv" name="ciclos" type="radio" class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300">
                <span>IV</span>
              </label>
              <label for="ciclo_v" class="flex gap-2 items-center block text-sm font-medium text-gray-700">
                <input value="V" {if isset($smarty.post.ciclos) && $smarty.post.ciclos == 'V'}checked{/if} id="ciclo_v" name="ciclos" type="radio" class="focus:ring-indigo-500 h-4 w-4 text-indigo-600 border-gray-300">
                <span>V</span>
              </label>
            </div>
          </div>
        </fieldset>
        </div>


      </div>
    </div>

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