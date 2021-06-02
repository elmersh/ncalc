{extends file="inc/theme.tpl"}
{$title = "home"}
{$active = "dashboard"}

{block name=content}
  <div class="pt-12 sm:pt-16">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="max-w-4xl mx-auto text-center">
        <h2 class="text-3xl font-extrabold text-gray-900 sm:text-4xl">Bienvenido {$u.nombre}!
        </h2>
        <p class="mt-3 text-xl text-gray-500 sm:mt-4">
          Promedios actuales de todas tus materias.
        </p>
      </div>
    </div>
    <div class="mt-10 pb-12 bg-white sm:pb-16">
      <div class="relative">
        <div class="absolute inset-0 h-1/2"></div>
        <div class="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="max-w-4xl mx-auto">
            <dl class="rounded-lg bg-white shadow-lg sm:grid xl:grid-cols-5  sm:grid-cols-3 relative z-10">
            {assign var=cum value=0}
              {if isset($results)}
              {foreach key=materia item=notas from=$results}
                <div
                  class="flex flex-col border-b border-gray-100 p-6 text-center sm:border-b sm:border-0 sm:border-r relative">

                  <dt class="order-2 mt-2 text-sm leading-6 font-bold text-gray-500">
                    {$materia}
                  </dt>
                  {assign var=sumPromedio value=0}
                  {foreach from=$notas item=nota key=id}
                    {$sumPromedio = $sumPromedio + $nota['nota']}
                  {/foreach}
                  <dd class="order-1 text-3xl font-extrabold text-indigo-600">
                    {$promedio = $sumPromedio / 5}
                    {$promedio}
                  </dd>
                  {math equation="abs(x)" x=$promedio-6 assign="promFinal"}
                  {if $promedio >= 5}
                  <div
                    class="inline-flex items-center rounded-full text-xs font-medium bg-green-100 text-green-800 absolute top-0 right-0 mr-2 mt-2 items-center ">
                    <span class="px-2.5 leading-tight mb-0.5">pasada</span>
                  </div>
                  {else}
                  <div
                  class="inline-flex items-center rounded-full text-xs font-medium bg-red-100 text-red-800 absolute top-0 right-0 mr-2 mt-1 items-center ">
                    <span class="px-2.5 leading-tight mb-0.5">
                      Vas por buen camino
                    </span>
                  </div>
                  {/if}
                </div>
                {$cum = $cum + $promedio}
              {/foreach}
              {/if}
            </dl>
            {if $cum}
              <div class="inline-flex items-center justify-end w-full relative -mt-2 mr-2">
                <span class="bg-green-500 px-6 text-3xl py-2 rounded-b-lg mr-2 text-white">Cum: {$cum / 5}</span>
              </div>
            {/if}
          </div>
        </div>
      </div>
    </div>
  </div>
{/block}