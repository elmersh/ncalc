{extends file="inc/theme.tpl"}
{$title = "materias"}
{$buttons = true}
{$urlid = $materia->id}
{$url = '/materias/notas/agregar?id='}
{$btitle = 'Añadir nota'}
{block name=content}
{if $smarty.session.id == $materia->id_usuario or $smarty.session.is_admin == true}
<div class="py-4 w-full">
    <h1 class="text-center text-4xl">{$materia->nombre}</h1>
</div>
<div class="flex flex-col">
  <div class="overflow-x-auto mx-auto ">
    <div class="py-2 align-middle inline-block min-w-sm max-w-2xl sm:px-6 lg:px-8">
      <div class="shadow overflow-hidden border-b border-gray-200 sm:rounded-lg">
        <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
          <tr>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              Unidad
            </th>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              Nota
            </th>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              Ponderación
            </th>
            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              Ponderada
            </th>
            <th scope="col" class="relative px-6 py-3">
              <span class="sr-only">Editar</span>
            </th>
          </tr>
        </thead>
          {foreach $notas as $id => $nota}
          {include file="inc/notas-loop.tpl"}
          {/foreach}
        </table>
      </div>
    </div>
  </div>
</div>
{else}
No tienes permisos para ver esta página.
{/if}
{/block}