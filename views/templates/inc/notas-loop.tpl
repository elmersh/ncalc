<tbody class="bg-white divide-y divide-gray-200">
  <tr class="h-5">
    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
      {$nota->unidad}
    </td>
    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
      {$nota->nota}
    </td>
    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
      {$nota->ponderacion * 100}%
    </td>
    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
      {$nota->nota * $nota->ponderacion}
    </td>
    <td x-data="{ 'showModal': false }" @keydown.escape="showModal = false" x-cloack class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium overflow-hidden h-5">
      <a @click="showModal = true" href="#" class="text-indigo-600 hover:text-indigo-900">borrar</a>
      {include file="inc/action-pannel.tpl" dato=$nota->nota}
    </td>
  </tr>
</tbody>