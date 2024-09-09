document.getElementById("rotateBtn").addEventListener("click", function() {
    const circle = document.getElementById("circle");
    
    // Aktualny stopień obrotu
    const currentRotation = circle.style.transform.match(/rotate\((\d+)deg\)/);
    const currentDegree = currentRotation ? parseInt(currentRotation[1], 10) : 0;
    
    // Obrót o 120 stopni zgodnie z ruchem wskazówek zegara
    const newDegree = currentDegree + 120;
    
    // Aktualizacja obrotu okręgu
    circle.style.transform = `rotate(${newDegree}deg)`;
  });
  