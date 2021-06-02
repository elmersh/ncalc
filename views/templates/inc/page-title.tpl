<div class="border-b border-gray-200 px-4 py-4 sm:flex sm:items-center sm:justify-between sm:px-6 lg:px-8">
        <div class="flex-1 min-w-0 py-2">
          <h1 class="text-lg font-medium leading-6 text-gray-900 sm:truncate uppercase">
              {$title}
          </h1>
        </div>
    {if $buttons}
        <div class="mt-4 flex sm:mt-0 sm:ml-4">
          <a href="{$url}{if $urlid}{$urlid}{/if}" class="order-0 inline-flex items-center px-2 py-1 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-green-600 hover:bg-green-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500 sm:order-1 sm:ml-3">
              {$btitle}
          </a>
        </div>
    {/if}
      </div>