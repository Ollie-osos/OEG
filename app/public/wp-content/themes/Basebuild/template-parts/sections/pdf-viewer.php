<?php
$pdf = get_sub_field('pdf');
$title = get_sub_field('title');

if ($pdf) {
?>

    <section class="pdf pt-5 pb-5">
        <div class="container border-bottom">
            <div class="row">
                <div class="col-sm-12">
                    <?php if ($title) { ?><h2><?php echo esc_html($title); ?></h2><?php } ?>
                </div>
            </div>
            <div class="row u-flex-row u-justify-center u-items-center">
                <div class="u-flex col-sm-12 u-justify-center u-items-center">
                    <div class="pdf-controls">
                        <button class="pdf-prev">⟨ Prev</button>
                        <span>Page <span class="pdf-page-display">1</span> of <span class="pdf-page-total">…</span></span>
                        <button class="pdf-next">Next ⟩</button>
                        <input type="number" class="pdf-goto" min="1" placeholder="Go to" style="width: 50px;">
                        <button class="pdf-go">Go</button>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div id="pdf-viewer" style="border: 1px solid #ccc; padding: 1rem; max-width: 100%;">
                        <canvas id="pdf-canvas" style="width: 100%; height: auto;"></canvas>
                    </div>
                </div>
                <div class="u-flex col-sm-12 u-justify-center u-items-center pt-2">
                    <div class="pdf-controls">
                        <button class="pdf-prev">⟨ Prev</button>
                        <span>Page <span class="pdf-page-display">1</span> of <span class="pdf-page-total">…</span></span>
                        <button class="pdf-next">Next ⟩</button>
                        <input type="number" class="pdf-goto" min="1" placeholder="Go to" style="width: 50px;">
                        <button class="pdf-go">Go</button>
                    </div>
                </div>
            </div>


        </div>



    </section>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js"></script>
    <script>
        const url = '<?php echo esc_url($pdf); ?>';
        let pdfDoc = null,
        pageNum = 1,
        pageRendering = false,
        pageNumPending = null,
        scale = 1.2,
        canvas = document.getElementById('pdf-canvas'),
        ctx = canvas.getContext('2d');

    function updateDisplays() {
      document.querySelectorAll('.pdf-page-display').forEach(el => el.textContent = pageNum);
      document.querySelectorAll('.pdf-page-total').forEach(el => el.textContent = pdfDoc.numPages);
    }

    function renderPage(num) {
      pageRendering = true;
      pdfDoc.getPage(num).then(page => {
        const viewport = page.getViewport({ scale: scale });
        canvas.height = viewport.height;
        canvas.width = viewport.width;

        const renderContext = {
          canvasContext: ctx,
          viewport: viewport
        };
        const renderTask = page.render(renderContext);

        renderTask.promise.then(() => {
          pageRendering = false;
          updateDisplays();
          if (pageNumPending !== null) {
            renderPage(pageNumPending);
            pageNumPending = null;
          }
        });
      });
    }

    function queueRenderPage(num) {
      if (pageRendering) {
        pageNumPending = num;
      } else {
        renderPage(num);
      }
    }

    pdfjsLib.getDocument(url).promise.then(pdf => {
      pdfDoc = pdf;
      updateDisplays();
      renderPage(pageNum);
    });

    document.querySelectorAll('.pdf-prev').forEach(button => {
      button.addEventListener('click', () => {
        if (pageNum <= 1) return;
        pageNum--;
        queueRenderPage(pageNum);
      });
    });

    document.querySelectorAll('.pdf-next').forEach(button => {
      button.addEventListener('click', () => {
        if (pageNum >= pdfDoc.numPages) return;
        pageNum++;
        queueRenderPage(pageNum);
      });
    });

    document.querySelectorAll('.pdf-go').forEach(button => {
      button.addEventListener('click', () => {
        const input = button.parentElement.querySelector('.pdf-goto');
        const desiredPage = parseInt(input.value);
        if (!isNaN(desiredPage) && desiredPage >= 1 && desiredPage <= pdfDoc.numPages) {
          pageNum = desiredPage;
          queueRenderPage(pageNum);
        }
      });
    });
  </script>
<?php }; ?>
